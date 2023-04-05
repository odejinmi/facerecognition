
import 'dart:convert';

import 'package:flutter/services.dart';

import 'facemodel.dart';
import 'facerecognition_platform_interface.dart';

class Facerecognition {
  static const MethodChannel _channel =
  MethodChannel("facerecognition");
  Future<String?> getPlatformVersion() {
    return FacerecognitionPlatform.instance.getPlatformVersion();
  }
  Future<Facemodel> startprinting (String image) async {
    Map<String, String> args = {
      "textprint": image
    };
    return _channel
        .invokeMethod("getFace", args)
        .then((dynamic result) => facemodelFromJson(jsonEncode(result)));
  }
}
