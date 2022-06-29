{ self, config, pkgs, lib, ... }:
let
  inherit (pkgs.stdenv) isLinux isDarwin;
in
{
  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "Inconsolata" "IBMPlexMono" "CascadiaCode" "SourceCodePro" "FiraCode" "Hack" "Iosevka"]; })
    ] ++ (lib.optionals isLinux{ 
     fontDir.enable = true;
  });};
}
