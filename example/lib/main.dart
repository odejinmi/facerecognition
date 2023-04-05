import 'dart:convert';
import 'dart:io';

import 'package:facerecognition/facemodel.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:facerecognition/facerecognition.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _facerecognitionPlugin = Facerecognition();
  ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _facerecognitionPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }
  Face? firstface;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Running on: $_platformVersion\n'),
            ),
            TextButton(onPressed: () async {
              var file = await imagePicker.pickImage(source: ImageSource.camera);
              if (file != null) {
                final bytes = await file.readAsBytes();
               Facemodel sola = await _facerecognitionPlugin.startprinting(base64Encode(bytes));
               List<Face> faces = sola.faces;
               print("object1234");
               // for(int i = 0; i < faces.length; i++){
               //   Face ndata = faces[i];
               //   print(ndata.landmarks);
               //   print(ndata.lefteyeopenprobability);
               //
               // }
               if (faces.length >1) {

               }else if(faces.length == 1){
                 firstface = faces[0];
                 setState(() {

                 });
               }
              }
            }, child: const Text("face1"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(firstface == null?Colors.white:Colors.blue),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: firstface != null?Colors.white:Colors.blue
                  ),
                ),
              ),
            ),
            TextButton(onPressed: () async {
              if (firstface == null) {
                print("kindly input the first image");
                return;
              }
              var file = await imagePicker.pickImage(source: ImageSource.camera);
              if (file != null) {
                final bytes = await file.readAsBytes();
               Facemodel sola = await _facerecognitionPlugin.startprinting(base64Encode(bytes));
               List<Face> faces = sola.faces;
               print("object1234");
               // for(int i = 0; i < faces.length; i++){
               //   Face ndata = faces[i];
               //   print(ndata.landmarks);
               //   print(ndata.lefteyeopenprobability);
               //
               // }
               if (faces.length >1) {

               }else if(faces.length == 1){
                 final face1Features = firstface!.landmarks;
                 final face2Features = faces[0].landmarks;
                 print(face1Features);
                 print(face2Features);
                 double totalSquaredDiff = 0.0;
                 for (int i = 0; i < face1Features.length; i++) {
                   final feature1 = face1Features[i];
                   final feature2 = face2Features[i];
                   final dx = feature1.position.x - feature2.position.x;
                   final dy = feature1.position.y - feature2.position.y;
                   final squaredDiff = dx * dx + dy * dy;
                   totalSquaredDiff += squaredDiff;
                 }
                 final euclideanDistance = totalSquaredDiff;
                 final matchThreshold = 0.3; // adjust this to your needs
                 print("euclideanDistance");
                 print(euclideanDistance);
                 setState(() {
                   print("does the face match");
                   print(euclideanDistance <= matchThreshold);
                 });
               }
              }
            }, child: const Text("face2")),

          ],
        ),
      ),
    );
  }
}
