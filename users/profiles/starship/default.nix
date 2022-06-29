{ pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  home.sessionVariables = {
    STARSHIP_CONFIG = pkgs.writeText "starship.toml" (lib.fileContents ./starship.toml);
  };
}
