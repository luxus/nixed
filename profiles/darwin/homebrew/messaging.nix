{ self, config, pkgs, ... }:

{
  homebrew.casks = [
    "discord-canary"
    "element"
    "signal"
    "slack"
    "zoom"
    "microsoft-teams"
    "pushplaylabs-sidekick"
  ];
}
