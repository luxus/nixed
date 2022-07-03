{ self, config, lib, pkgs, ... }:

let
  inherit (pkgs.stdenv) isLinux;
in
{
  programs.java.enable = true;
  programs.zsh.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  environment = {
    systemPackages = with pkgs; [
      bat
      binutils
      coreutils
      #FIXME: fails on aarch64
      # dnsutils
      #uutils-coreutils
      exa
      gnumake
      unzip
      gcc
      curl
      broot
      zellij
      dosfstools
      dutree
      fish
      fd
      git
      bottom
      btop
      difftastic
      gitui
      du-dust
      bandwhich
      prettyping
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
      gitkraken
      brave
      logseq
      iputils
      wtf
      steam-run-native
      steam.run
      # (steam.override { withJava = true; })
      # (steam.override {
      #  withPrimus = true;
      #  extraPkgs = pkgs: [ bumblebee glxinfo ];
      # }).run
      vulkan-tools
      clinfo
      file
      procs
      usbutils
      utillinux
      cups
      obs-studio
    ]);
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
