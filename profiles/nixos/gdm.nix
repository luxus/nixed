{ self, config, pkgs, ... }:

{
  services.xserver.displayManager = {
    gdm = {
      enable = false;
      settings = {
        daemon = {
          FirstVT = 7;
      };
    };
    };
    autoLogin = {
      enable = true;
      user = "luxus";
        };
  };
}
