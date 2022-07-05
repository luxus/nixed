{ self, config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  time.timeZone = "Europe/Zurich";

  networking = {
    hostName = "vanessa";
    useDHCP = false;
    networkmanager = {
      enable = true;
      # insertNameservers = [ "1.1.1.1" "1.0.0.1" "2606:4700:4700::1111" "2606:4700:4700::1001" ];
      # dns = "none";
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";
  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  age.secrets.luxus-user-vanessa.file = "${self}/secrets/luxus-user-vanessa.age";
  users.users.luxus.passwordFile = "/run/agenix/luxus-user-vanessa";
  age.secrets.root-user-vanessa.file = "${self}/secrets/root-user-vanessa.age";
  users.users.root.passwordFile = "/run/agenix/root-user-vanessa";
  age.identityPaths = [
    "/persist/etc/ssh/ssh_host_ed25519_key"
  ];
  home-manager.sharedModules = [
    {
      services.polybar.config."module/wlan".interface = lib.mkForce "wlo1";
      services.polybar.config."bar/oofbar".modules-right = lib.mkForce "input dot storage dot cpu dot mem dot audio dot bluetooth dot wlan dot date spacer launcher";
    }
  ];

  services.earlyoom.enable = true;

  system.stateVersion = "21.11";
}

