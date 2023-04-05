#ifndef FLUTTER_PLUGIN_FACERECOGNITION_PLUGIN_H_
#define FLUTTER_PLUGIN_FACERECOGNITION_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace facerecognition {

class FacerecognitionPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FacerecognitionPlugin();

  virtual ~FacerecognitionPlugin();

  // Disallow copy and assign.
  FacerecognitionPlugin(const FacerecognitionPlugin&) = delete;
  FacerecognitionPlugin& operator=(const FacerecognitionPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace facerecognition

#endif  // FLUTTER_PLUGIN_FACERECOGNITION_PLUGIN_H_
