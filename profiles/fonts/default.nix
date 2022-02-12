{ self, config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      ibm-plex
      (nerdfonts.override { fonts = [ "IBMPlexMono" "JetBrainsMono" ]; })
    ];
    fontconfig.defaultFonts = {
      monospace = [ "BlexMono Nerd Font" ];
      sansSerif = [ "IBM Plex Sans" "IBM Plex Sans JP" ];
      serif = [ "IBM Plex Serif" ];
    };
  };

}