{ self, config, pkgs, lib, ... }:

lib.mkIf pkgs.stdenv.isLinux {
  home.packages = with pkgs; [
    _1password-gui
    _1password
  ];
}
