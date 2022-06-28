{ self, config, ... }:

{
  programs.lsd = {
    enable = true;
    enableAliases = true;
  };
}
