{ config, lib, pkgs, modulesPath, ... }:

{
  environment.systemPackages = with pkgs; [
    efibootmgr
    refind
  ];


  systemd.coredump.enable = true;
  boot = {
    loader = {
      timeout = lib.mkDefault 5;
      efi.canTouchEfiVariables = true;
      grub.enable = false;
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 100;
      };
    };


    initrd = {
      #   luks.devices."root" = {
      #     device = "/dev/disk/by-uuid/201c36cc-a740-4d8e-8956-b63784c9d475";
      #     preLVM = true;
      #     keyFile = "/keyfile.bin";
      #     allowDiscards = true;
      #   };
      #   secrets = {
      #     "keyfile.bin" = "/etc/secrets/initrd/keyfile.bin";
      #   };
      #   availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      #   kernelModules = [ "dm-snapshot" "amdgpu" ];
      systemd.enable = true;
      verbose = false;
    };

    # kernelModules = [ "amdgpu" "kvm-amd" "wl" ];
    # kernelParams = [
    #   "quiet"
    #   "splash"
    #   "loglevel=1"
    #   "rd.systemd_show_status=false"
    #   "rd.udev.log_level=3"
    #   "udev.log_priority=3"
    #   "boot.shell_on_fail"
    # ];

    consoleLogLevel = 0;
    plymouth = {
      enable = true;
      theme = "spinning-watch";
      font = "${pkgs.ibm-plex}/share/fonts/opentype/IBMPlexSans-Text.otf";
      themePackages = with pkgs; [
        plymouth-spinning-watch-theme
      ];
    };
  };

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  services.xserver.videoDrivers = [ "amdgpu" ];

  systemd.services.systemd-udev-settle.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  virtualisation.kvmgt = {
    enable = true;
    device = "0000:00:02.0";
    vgpus = {
      i915-GVTg_V5_4 = {
        uuid = [
          "15feffce-745b-4cb6-9f48-075af14cdb6f"
        ];
      };
    };
  };
  services.hercules-ci-agent.settings = {
    concurrentTasks = 2;
  };
  hardware.opengl.driSupport = true;
  # For 32 bit applications
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = [
    pkgs.amdvlk
    pkgs.rocm-opencl-icd
  ];
  # To enable Vulkan support for 32-bit applications, also add:
  hardware.opengl.extraPackages32 = [
    pkgs.driversi686Linux.amdvlk
  ];

  # Force radv
  environment.variables.AMD_VULKAN_ICD = "RADV";
  # Or
  environment.variables.VK_ICD_FILENAMES =
    "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
  # environment.global-persistence.enable = true;
  # environment.global-persistence.root = "/persist";
  boot.kernelModules = [ "v4l2loopback" "kvm-intel" "wl" ];
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "sr_mod" "uas" ];
  boot.initrd.luks.forceLuksSupportInInitrd = true;
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  boot.initrd.kernelModules = [ "amdgpu" "tpm" "tpm_tis" "tpm_crb" ];
  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/2c913cfd-aa74-4629-b8a0-0a0a080e1f19";
  # boot.initrd.preLVMCommands = ''
  #   waitDevice /dev/disk/by-uuid/2c913cfd-aa74-4629-b8a0-0a0a080e1f19
  #   ${pkgs.clevis}/bin/clevis luks unlock -d /dev/disk/by-uuid/2c913cfd-aa74-4629-b8a0-0a0a080e1f19 -n enc
  # '';
  # fileSystems."/" = {
  #   device = "none";
  #   fsType = "tmpfs";
  #   options = [ "defaults" "size=5G" "mode=755" ];
  # };
  #fileSystems."/" =
  # { device = "/dev/disk/by-uuid/a5a16dd1-f62f-4175-9144-fd2cd8383643";
  #   fsType = "btrfs";
  #   options = [ "subvol=root" ];
  # };
  #fileSystems."/" = btrfsSubvolMain "@root" { };
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/a5a16dd1-f62f-4175-9144-fd2cd8383643";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };
  # fileSystems."/nix" = btrfsSubvolMain "@nix" { neededForBoot = true; };
  # fileSystems."/persist" = btrfsSubvolMain "@persist" { neededForBoot = true; };
  # fileSystems."/var/log" = btrfsSubvolMain "@var-log" { neededForBoot = true; };
  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/a5a16dd1-f62f-4175-9144-fd2cd8383643";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };


  fileSystems."/persist" =
    {
      device = "/dev/disk/by-uuid/a5a16dd1-f62f-4175-9144-fd2cd8383643";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
      neededForBoot = true;
    };

  fileSystems."/var/log" =
    {
      device = "/dev/disk/by-uuid/a5a16dd1-f62f-4175-9144-fd2cd8383643";
      fsType = "btrfs";
      options = [ "subvol=var-log" ];
      neededForBoot = true;
    };
  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/61B1-2C06";
      fsType = "vfat";
    };
  swapDevices = [{
    device = "/dev/disk/by-uuid/fa4fe315-136c-47d2-9ecb-726d4901ae75";
  }];
}
