{ self, config, pkgs, ... }:
{
  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  home.packages = with pkgs; [
    steam-run
    steam
    # steam-orginal
    # steam-runtime
    libgdiplus
    #     (steam.override {
    #    withPrimus = true;
    #    extraPkgs = pkgs: [ bumblebee glxinfo ];
    # }).run
  ];
  # nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  #   "steam"
  #   "steam-original"
  #   "steam-runtime"
  # ];
  # programs.java.enable = true;
  # environment.systemPackages = with pkgs; [
  #   (steam.override { withJava = true; })
  # ];
}
