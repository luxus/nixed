{ self, config, lib, pkgs, ... }:
let
  myCustomLayout = pkgs.writeText "xkb-layout" ''
    ! Map umlauts to RIGHT ALT + <key>
    keycode 108 = Mode_switch
    keysym e = e E EuroSign
    keysym c = c C cent
    keysym a = a A adiaeresis Adiaeresis
    keysym o = o O odiaeresis Odiaeresis
    keysym u = u U udiaeresis Udiaeresis
    keysym s = s S ssharp

    ! disable capslock
    ! remove Lock = Caps_Lock
  '';
in

{
  # Graphics support
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Theming helpers
  programs.dconf.enable = true;
  services.dbus.packages = with pkgs; [ dconf ];
  services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xmodmap}/bin/xmodmap ${myCustomLayout}";
  services.xrdp = {
    enable = true;
  };
  services.xserver = {
    enable = true;
    videoDrivers = [ "modesetting" ]; # Base, all hosts should set accordingly
    layout = "us";
    libinput.enable = true;
    windowManager.leftwm.enable = true;
    desktopManager.xterm.enable = false;
  };

  environment.variables = {
    GTK_THEME = "Orchis:dark";
  };
}
