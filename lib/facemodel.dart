// To parse this JSON data, do
//
//     final facemodel = facemodelFromJson(jsonString);

import 'dart:convert';

Facemodel facemodelFromJson(String str) => Facemodel.fromJson(json.decode(str));

String facemodelToJson(Facemodel data) => json.encode(data.toJson());

class Facemodel {
  Facemodel({
    required this.faces,
  });

  List<Face> faces;

  factory Facemodel.fromJson(Map<String, dynamic> json) => Facemodel(
    faces: List<Face>.from(json["Faces"].map((x) => Face.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "faces": List<dynamic>.from(faces.map((x) => x.toJson())),
  };
}

class Face {
  Face({
    required this.rotY,
    required this.rotZ,
    required this.landmarks,
    required this.allContours,
    required this.rotX,
    required this.smile,
    required this.lefteyeopenprobability,
    required this.righteyeprobability,
    required this.trackinid,
  });

  double rotY;
  double rotZ;
  List<Landmark> landmarks;
  AllContours allContours;
  double rotX;
  String smile;
  String lefteyeopenprobability;
  String righteyeprobability;
  String trackinid;

  factory Face.fromJson(Map<String, dynamic> json) => Face(
    rotY: json["rotY"]?.toDouble(),
    rotZ: json["rotZ"]?.toDouble(),
    landmarks: List<Landmark>.from(json["landmarks"].map((x) => Landmark.fromJson(x))),
    allContours: AllContours.fromJson(json["allContours"]),
    rotX: json["rotX"]?.toDouble(),
    smile: json["smile"],
    lefteyeopenprobability: json["lefteyeopenprobability"],
    righteyeprobability: json["righteyeprobability"],
    trackinid: json["trackinid"],
  );

  Map<String, dynamic> toJson() => {
    "rotY": rotY,
    "rotZ": rotZ,
    "landmarks": List<dynamic>.from(landmarks.map((x) => x.toJson())),
    "allContours": allContours.toJson(),
    "rotX": rotX,
    "smile": smile,
    "lefteyeopenprobability": lefteyeopenprobability,
    "righteyeprobability": righteyeprobability,
    "trackinid": trackinid,
  };
}

class AllContours {
  AllContours();

  factory AllContours.fromJson(Map<String, dynamic> json) => AllContours(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Landmark {
  Landmark({
    required this.type,
    required this.position,
  });

  int type;
  Position position;

  factory Landmark.fromJson(Map<String, dynamic> json) => Landmark(
    type: json["type"],
    position: Position.fromJson(json["position"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "position": position.toJson(),
  };

  @override
  String toString() => '{ "type": $type, "position": $position} ';
}

class Position {
  Position({
    required this.x,
    required this.y,
  });

  double x;
  double y;

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    x: json["x"]?.toDouble(),
    y: json["y"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
  };

  @override
  String toString() => ' [ "x": $x, "y": $y ]';
}
