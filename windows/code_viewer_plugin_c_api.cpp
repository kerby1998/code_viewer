#include "include/code_viewer/code_viewer_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "code_viewer_plugin.h"

void CodeViewerPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  code_viewer::CodeViewerPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
