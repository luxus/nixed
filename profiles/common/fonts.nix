{ self, config, pkgs, lib, ... }:

{
  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "Inconsolata" "IBMPlexMono" "CascadiaCode" "SourceCodePro" "FiraCode" "Hack" "Iosevka"]; })
    ];
    # fontDir.enable = true;
  };
}
