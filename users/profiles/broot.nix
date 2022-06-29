{ self, config, ... }:

{
  programs.broot = {
    enable = true;
    enableAliases = true;
  };
}
