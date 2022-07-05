{ self, config, pkgs, ... }:

{
  programs.noisetorch.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    media-session.enable = false;

    # emulations
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
  };
  hardware.pulseaudio.enable = false;
}
