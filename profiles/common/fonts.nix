{ self, config, pkgs, lib, ... }:
let
  inherit (pkgs.stdenv) isLinux isDarwin;
in
{
  fonts = {
    fonts = with pkgs; [
      corefonts # Micrsoft free fonts
      # noto-fonts-emoji
      iosevka
      # emojione
      (nerdfonts.override { fonts = [ "Inconsolata" "IBMPlexMono" "CascadiaCode" "SourceCodePro" "FiraCode" "Hack" "Iosevka" "AnonymousPro" ]; })
    ];
  };
}
