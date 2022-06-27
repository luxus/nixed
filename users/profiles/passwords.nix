{ self, config, pkgs, lib, ... }:

lib.mkIf pkgs.stdenv.isLinux {
  home.packages = with pkgs; [
    _1password_gui
    _1password
  ];
}
