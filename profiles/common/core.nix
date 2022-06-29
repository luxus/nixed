{ self, config, lib, pkgs, ... }:

let
  inherit (pkgs.stdenv) isLinux;
in
{
  programs.zsh.enable = true;

  environment = {
    systemPackages = with pkgs; [
      bat
      binutils
      coreutils
      #FIXME: fails on aarch64
      # dnsutils
      #uutils-coreutils
      exa
      curl
      broot
      zellij
      dosfstools
      dutree
      fish
      fd
      git
      bottom
      jq
      lsof
      manix
      moreutils
      nix-index
      gnupg
      prettyping
      neovim-nightly
      nmap
      lazygit
      ripgrep
      skim
      tealdeer
      tokei
      tree
      whois
      zoxide
    ] ++ (lib.optionals isLinux [
      gptfdisk
      iputils
      file
      procs
      usbutils
      utillinux
    ]);

    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
