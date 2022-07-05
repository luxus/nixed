{ self, pkgs, lib, ... }:

{
  users.users.luxus = {
    uid = 1000;
    description = "luxus";
    shell = pkgs.zsh;
  } // (lib.optionalAttrs pkgs.stdenv.isLinux {
    extraGroups = [ "wheel" "audio" "video" "input" "networkmanager" "libvirtd" "adbusers" "dialout" ];
    isNormalUser = true;
  });
  home-manager.users.luxus = { suites, ... }: {
    imports = with suites;
      if pkgs.stdenv.isLinux then
        base ++ dev ++ graphical ++ apps
      else
        base ++ dev ++ apps;

    home.stateVersion = "22.11";
    programs.git = {
      userEmail = "luxuspur@gmail.com";
      userName = "luxus";
    };
  };
}
