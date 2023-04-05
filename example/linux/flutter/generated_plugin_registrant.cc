//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <facerecognition/facerecognition_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) facerecognition_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FacerecognitionPlugin");
  facerecognition_plugin_register_with_registrar(facerecognition_registrar);
}
