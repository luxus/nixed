{ self, config, pkgs, ... }:

{
  homebrew.casks = [
    "firefox"
    "kitty"
    "wezterm-nightly"
  ];

  homebrew.brews = [
    "fileicon"
  ];
}
