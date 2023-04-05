import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'facerecognition_method_channel.dart';

abstract class FacerecognitionPlatform extends PlatformInterface {
  /// Constructs a FacerecognitionPlatform.
  FacerecognitionPlatform() : super(token: _token);

  static final Object _token = Object();

  static FacerecognitionPlatform _instance = MethodChannelFacerecognition();

  /// The default instance of [FacerecognitionPlatform] to use.
  ///
  /// Defaults to [MethodChannelFacerecognition].
  static FacerecognitionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FacerecognitionPlatform] when
  /// they register themselves.
  static set instance(FacerecognitionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

}
