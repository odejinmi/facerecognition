import 'dart:ui';

class FaceLandmark {
  static const int MOUTH_BOTTOM = 0;
  static const int MOUTH_RIGHT = 11;
  static const int MOUTH_LEFT = 5;
  static const int RIGHT_EYE = 10;
  static const int LEFT_EYE = 4;
  static const int RIGHT_EAR = 9;
  static const int LEFT_EAR = 3;
  static const int RIGHT_CHEEK = 7;
  static const int LEFT_CHEEK = 1;
  static const int NOSE_BASE = 6;

  final int zza;
  final Offset zzb;

  int getLandmarkType() {
    return this.zza;
  }

  Offset getPosition() {
    return this.zzb;
  }

  @override
  String toString() {
    return 'FaceLandmark{type: $zza, position: $zzb}';
  }

  FaceLandmark(this.zza, this.zzb);
}

class LandmarkType {
  static const int MOUTH_BOTTOM = FaceLandmark.MOUTH_BOTTOM;
  static const int MOUTH_RIGHT = FaceLandmark.MOUTH_RIGHT;
  static const int MOUTH_LEFT = FaceLandmark.MOUTH_LEFT;
  static const int RIGHT_EYE = FaceLandmark.RIGHT_EYE;
  static const int LEFT_EYE = FaceLandmark.LEFT_EYE;
  static const int RIGHT_EAR = FaceLandmark.RIGHT_EAR;
  static const int LEFT_EAR = FaceLandmark.LEFT_EAR;
  static const int RIGHT_CHEEK = FaceLandmark.RIGHT_CHEEK;
  static const int LEFT_CHEEK = FaceLandmark.LEFT_CHEEK;
  static const int NOSE_BASE = FaceLandmark.NOSE_BASE;
}