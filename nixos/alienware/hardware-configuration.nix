# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.grub.configurationLimit = 5;
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/18e5b6ce-340a-4f9e-a895-1e1ecc018828";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/775D-DD1E";
      fsType = "vfat";
    };

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/c3b03619-4a86-49a4-9ec6-37c891062b24";
    fsType = "ext4";
  };
  swapDevices =
    [ { device = "/dev/disk/by-uuid/b2f2c7af-2e55-4e98-857b-3a60ec28b875"; } ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  services.xserver.videoDrivers = [ "intel" "nvidia" ];
  hardware.video.hidpi.enable = false;
  hardware.opengl.driSupport32Bit = false;

  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;
  networking = {
    useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = true;
    networkmanager.enable = true;
  };

}
