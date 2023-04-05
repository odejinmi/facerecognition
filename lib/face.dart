// import 'package:flutter/material.dart';
//
// import 'facecontour.dart';
// import 'facelandmark.dart';
//
// class Face {
//   final Rect zza;
//   int zzb;
//   final double zzc;
//   final double zzd;
//   final double zze;
//   final double zzf;
//   final double zzg;
//   final double zzh;
//   final List<FaceContour> zzi;
//   final List<FaceLandmark> zzj;
//
//   Face({
//     required this.zza,
//     required this.zzb,
//     required this.zzc,
//     required this.zzd,
//     required this.zze,
//     required this.zzf,
//     required this.zzg,
//     required this.zzh,
//     required this.zzi,
//     required this.zzj,
//   });
//
//   double getHeadEulerAngleX() {
//     return this.zzf;
//   }
//
//   double getHeadEulerAngleY() {
//     return this.zzg;
//   }
//
//   double getHeadEulerAngleZ() {
//     return this.zzh;
//   }
//
//   Rect getBoundingBox() {
//     return this.zza;
//   }
//
//   FaceContour? getContour(int contourType) {
//     return this.zzj.get(contourType);
//   }
//
//   FaceLandmark? getLandmark(int landmarkType) {
//     return this.zzi.get(landmarkType);
//   }
//
//   double? getLeftEyeOpenProbability() {
//     double var1 = this.zze;
//     return !(var1 < 0.0) && !(var1 > 1.0) ? this.zzd : null;
//   }
//
//   double? getRightEyeOpenProbability() {
//     double var1 = this.zzc;
//     return !(var1 < 0.0) && !(var1 > 1.0) ? var1 : null;
//   }
//
//   double? getSmilingProbability() {
//     double var1 = this.zze;
//     return !(var1 < 0.0) && !(var1 > 1.0) ? var1 : null;
//   }
//
//   int? getTrackingId() {
//     int var1 = this.zzb;
//     return var1 == -1 ? null : var1;
//   }
//
//   @override
//   String toString() {
//     final var2 = toMap();
//     return 'Face $var2';
//   }
//
//   Map<String, dynamic> toMap() {
//     final var2 = {
//       'boundingBox': zza,
//       'trackingId': zzb,
//       'rightEyeOpenProbability': zzc,
//       'leftEyeOpenProbability': zzd,
//       'smileProbability': zze,
//       'eulerX': zzf,
//       'eulerY': zzg,
//       'eulerZ': zzh,
//       'landmarks': _landmarksToString(),
//       'contours': _contoursToString(),
//     };
//     return var2;
//   }
//
//   String _landmarksToString() {
//     final var3 = <String, dynamic>{};
//     for (var i = 0; i <= 11; ++i) {
//       if (_zze(i)) {
//         var3['landmark_$i'] = getLandmark(i);
//       }
//     }
//     return var3.toString();
//   }
//
//   String _contoursToString() {
//     final var3 = <String, dynamic>{};
//     for (var i = 1; i <= 15; ++i) {
//       var3['Contour_$i'] = getContour(i);
//     }
//     return var3.toString();
//   }
//
//   List<FaceContour> getAllContours() {
//     final var2 = <FaceContour>[];
//     final var3 = zzj.length;
//     for (var i = 0; i < var3; ++i) {
//       var2.add(zzj[i] as FaceContour);
//     }
//     return var2;
//   }
//
//   List<FaceLandmark> getAllLandmarks() {
//     final var2 = <FaceLandmark>[];
//     final var3 = zzi.length;
//     for (var i = 0; i < var3; ++i) {
//       var2.add(zzi[i] as FaceLandmark);
//     }
//     return var2;
//   }
//
//   SparseArray zza() {
//     return zzj;
//   }
//
//   void zzb(List<dynamic> var1) {
//     this.zzj.clear();
//
//     for (int var2 = 0; var2 < var1.length; ++var2) {
//       this.zzj.add({var1.keyAt(var2), var1[var2]});
//     }
//   }
//
//   void zzc(int var1) {
//     this.zzb = -1;
//   }
//
//   static bool zzd(int var0) {
//     return var0 <= 15 && var0 > 0;
//   }
//
//   static bool zze(int var0) {
//     return var0 == 0 ||
//         var0 == 1 ||
//         var0 == 7 ||
//         var0 == 3 ||
//         var0 == 9 ||
//         var0 == 4 ||
//         var0 == 10 ||
//         var0 == 5 ||
//         var0 == 11 ||
//         var0 == 6;
//   }
//
// }