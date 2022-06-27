{ self, config, pkgs, lib, ... }:

{
  users.users.luxus.home = "/Users/luxus";
  users.users.luxus.isHidden = false;
services.nix-daemon.enable = true;
  networking.hostName = "emily";

  security.pam.enableSudoTouchIdAuth = true;

  system.stateVersion = 4;
}
