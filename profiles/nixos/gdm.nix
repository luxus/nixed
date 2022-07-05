{ self, config, pkgs, ... }:

{
  services.xserver.displayManager = {
    gdm = {
      enable = true;
      settings = {
        daemon = {
          FirstVT = 7;
          autoLogin = {
              enable = true;
              user = "luxus";
        };
      };
    };
  };
}
