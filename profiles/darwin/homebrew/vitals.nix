{ self, config, pkgs, ... }:

{
  homebrew.casks = [
    "firefox"
    "brave-browser"
    "kitty"
    "wezterm-nightly"
  ];

  homebrew.brews = [
    "fileicon"
    "wtfutil"
  ];
}
