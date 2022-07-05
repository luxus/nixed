#!/bin/bash
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A uninstaller
./result/bin/darwin-uninstaller
sudo mv /etc/zshrc.backup-before-nix /etc/zshrc
sudo mv /etc/bashrc.backup-before-nix /etc/bashrc
sudo mv /etc/bash.bashrc.backup-before-nix /etc/bash.bashrc
sudo vifs

sudo launchctl unload /Library/LaunchDaemon/org.nixos.nix-daemon.plist
sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
sudo launchctl unload /Library/LaunchDaemons/org.nixos.activate-system.plist
sudo rm /Library/LaunchDaemons/org.nixos.activate-system.plist

sudo rm -rf /etc/nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels
sudo dscl . delete /Groups/nixbld
for i in $(seq 1 32); do sudo dscl . -delete /Users/_nixbld$i; done
sudo diskutil apfs deleteVolume /nix
sudo rm -rf /nix/
sudo rm /etc/nix/nix.conf
