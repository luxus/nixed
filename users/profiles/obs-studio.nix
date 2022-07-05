{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ (wrapOBS { plugins = [ obs-studio-plugins.obs-multi-rtmp obs-studio-plugins.obs-vkcapture obs-studio-plugins.obs-move-transition obs-studio-plugins.wlrobs obs-studio-plugins.obs-gstreamer obs-studio-plugins.obs-websocket ]; }) ];
}
