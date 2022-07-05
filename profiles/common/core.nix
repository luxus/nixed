{ self, config, lib, pkgs, ... }:

let
  inherit (pkgs.stdenv) isLinux;
in
{
  # programs.java.enable = true;
  programs.zsh.enable = true;
  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #   dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  # };
  environment = {
    systemPackages = with pkgs; [
      bat
      binutils
      coreutils
      #FIXME: fails on aarch64
      # dnsutils
      #uutils-coreutils
      exa
      unzip
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
      delta
      gitui
      micro
      _1password
      du-dust
      bandwhich
      hyperfine
      crabz
      # funzzy
      diskonaut
      prettyping
      jq
      lsof
      manix
      moreutils
      nix-index
      fd
      gnupg
      prettyping
      neovim-nightly
      nmap
      # rip
      gfold
      lazygit
      ripgrep
      sd
      skim # sk - replacement for grep
      tealdeer
      tokei
      tree
      whois
      zoxide
      wego
      duf
      dog
      procs
      ncspot
      ouch
      ncdu
    ] ++ (lib.optionals isLinux [
      #FIXME: fails on aarch64
      atuin
      aria2

      #FIXME: not needed on aarch64?
      gnumake
      turbovnc
      gcc
      gptfdisk
      iputils
      wtf
      ##graphical
      gitkraken
      brave
      thunderbird
      haruna
      logseq
      vaultwarden
      protonup
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
