#include "include/facerecognition/facerecognition_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "facerecognition_plugin.h"

void FacerecognitionPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  facerecognition::FacerecognitionPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
