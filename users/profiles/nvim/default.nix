{ self, config, pkgs, lib, ... }:

let

in
{
       # failed on aarch64
#  home.packages = with pkgs; [
#    neovim-remote
#  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    withPython3 = true;
    withRuby = false;
    withNodeJs = false;

    extraPackages = with pkgs; [
    #   # Language servers
      pyright
      ccls
      gopls
    #   ltex-ls
       nodePackages.bash-language-server
      sumneko-lua-language-server
    #   rnix-lsp
      tree-sitter
      alejandra

    #   # null-ls sources
       asmfmt
       # failed on aarch64
      # black
       codespell
       cppcheck
      deadnix
       editorconfig-checker
       gofumpt
      nixpkgs-fmt
      gitlint
       mypy
       nodePackages.alex
      nodePackages.prettier
      nodePackages.markdownlint-cli
      proselint
      python3Packages.flake8

       # failed on aarch64
      #  shellcheck
       shellharden
       shfmt
       statix
       stylua
       vim-vint

    #   # Other stuff
       bc
       cowsay
    ];
  };
}
