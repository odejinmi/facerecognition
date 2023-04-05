import 'dart:html';
import 'dart:ui';

class FaceContour {
  static const int FACE = 1;
  static const int LEFT_EYEBROW_TOP = 2;
  static const int LEFT_EYEBROW_BOTTOM = 3;
  static const int RIGHT_EYEBROW_TOP = 4;
  static const int RIGHT_EYEBROW_BOTTOM = 5;
  static const int LEFT_EYE = 6;
  static const int RIGHT_EYE = 7;
  static const int UPPER_LIP_TOP = 8;
  static const int UPPER_LIP_BOTTOM = 9;
  static const int LOWER_LIP_TOP = 10;
  static const int LOWER_LIP_BOTTOM = 11;
  static const int NOSE_BRIDGE = 12;
  static const int NOSE_BOTTOM = 13;
  static const int LEFT_CHEEK = 14;
  static const int RIGHT_CHEEK = 15;

  final int _type;
  final List<Point> _points;

  FaceContour(this._type, this._points);

  int get faceContourType => _type;

  List<Point> get points => _points;

  @override
  String toString() {
    return 'FaceContour(type: $_type, points: $_points)';
  }
}