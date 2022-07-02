{ self, config, ... }:

{
  programs.lsd = {
    enable = true;
    enableAliases = true;
        settings = {
          permission = "octal";
          sorting = { dir-grouping = "first"; };
          # symlink-arrow = "->";
        };
  };
}
