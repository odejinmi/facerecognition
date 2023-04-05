package com.a5starcompany.facerecognition

import android.app.AlertDialog
import android.graphics.BitmapFactory
import android.hardware.Camera
import android.util.Base64
import android.util.Log
import androidx.annotation.NonNull
import com.google.android.gms.tasks.OnFailureListener
import com.google.android.gms.tasks.OnSuccessListener
import com.google.android.gms.tasks.Task
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.face.*

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.json.JSONObject

/** FacerecognitionPlugin */
class FacerecognitionPlugin: FlutterPlugin, MethodCallHandler , Camera.FaceDetectionListener {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "facerecognition")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "getFace") {
        pickImageFromGallery(call, result)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun pickImageFromGallery(call: MethodCall, @NonNull result: Result) {
    val base64String = call.argument<String>("textprint")
    val decodedBytes = Base64.decode(base64String, Base64.DEFAULT)
    val bitmap = BitmapFactory.decodeByteArray(decodedBytes, 0, decodedBytes.size)
    val image: InputImage = InputImage.fromBitmap(bitmap, 0)
    detectFaces(image,result)
  }

  private fun detectFaces(image: InputImage, @NonNull result: Result) {
    // [START set_detector_options]
    val options: FaceDetectorOptions = FaceDetectorOptions.Builder()
      .setPerformanceMode(FaceDetectorOptions.PERFORMANCE_MODE_FAST)
      .setLandmarkMode(FaceDetectorOptions.LANDMARK_MODE_ALL)
      .setClassificationMode(FaceDetectorOptions.CLASSIFICATION_MODE_ALL)
      .setMinFaceSize(0.15f)
      .enableTracking()
      .build()
    // [END set_detector_options]

    // [START get_detector]
    val detector: FaceDetector = FaceDetection.getClient(options)
    // Or use the default options:
    // FaceDetector detector = FaceDetection.getClient();
    // [END get_detector]
    Log.d("track", "start result")
    // [START run_detector]
      val result = detector.process(image)
          .addOnSuccessListener(
              OnSuccessListener<List<Face>> { faces -> // Task completed successfully
                  // [START_EXCLUDE]
                  // [START get_face_info]
                  val map: MutableMap<String, Any> = mutableMapOf()
                  Log.d("track", "success listerner")
                  Log.d("track faces", faces.toString())
                  Log.d("count faces", faces.toTypedArray().size.toString())
                  val map1: MutableMap<String, Any> = mutableMapOf()

                  val list1 = mutableListOf<Map<String, Any>>()
                  for (face in faces) {
                      val bounds = face.boundingBox
                      val rotY = face.headEulerAngleY // Head is rotated to the right rotY degrees
                      val rotZ = face.headEulerAngleZ // Head is tilted sideways rotZ degrees
                      val landmarks = face.allLandmarks
                      val allContours = face.allContours
//                      map1.put("bounds", face.boundingBox)
                      map1.put("rotY", face.headEulerAngleY)
                      map1.put("rotZ", face.headEulerAngleZ)
                      val list = mutableListOf<Map<String, Any>>()
                      for (landmark in face.allLandmarks) {
                          val map2: MutableMap<String, Any> = mutableMapOf()
                          map2.put("type", landmark.landmarkType)
                          val map4: MutableMap<String, Any> = mutableMapOf()
                          map4.put("x", landmark.position.x)
                          map4.put("y", landmark.position.y)
                          map2.put("position", map4)
                          list.add(map2)
                      }
                      map1.put("landmarks", list)
                      val map3: MutableMap<String, Any> = mutableMapOf()
                      for (contours in face.allContours) {
                          map3.put("type", contours.faceContourType)
                          val map5: MutableMap<String, Any> = mutableMapOf()
//                          map5.put("x", contours.points.)
//                          map5.put("y", contours.position.y)
                          map3.put("position", contours.points)
                      }
                      map1.put("allContours", map3)
                      map1.put("rotX", face.headEulerAngleX)
                      map1.put("smile", face.smilingProbability.toString())
                      map1.put("lefteyeopenprobability", face.leftEyeOpenProbability.toString())
                      map1.put("righteyeprobability", face.rightEyeOpenProbability.toString())
                      map1.put("trackinid", face.trackingId.toString())
                      Log.d("samji bounds Y", rotY.toString())
                      Log.d("samji bounds Z", rotZ.toString())
                      Log.d("samji bounds", bounds.toString())
                      Log.d("samji landmarks", landmarks.toString())
                      Log.d("samji allContours", allContours.toString())

                      list1.add(map1)
                  }

                  map.put("Faces", list1)
                  result?.success(map)
              })
          .addOnFailureListener { e -> // Task failed with an exception
              // ...
              Log.e("face error", e.toString())
          }
    // [END run_detector]
  }

  override fun onFaceDetection(faces: Array<Camera.Face>, camera: Camera?) {
    if (faces.size > 0) {
      Log.d(
        "FaceDetection", "face detected: " + faces.size +
                " Face 1 Location X: " + faces[0].rect.centerX() +
                "Y: " + faces[0].rect.centerY()
      )

//            if(loading ==0) {
//                takeImage();
//            }
    }
  }
}
