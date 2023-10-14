# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];
  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/7e715946-b422-4d77-88eb-dfe2fa327b19";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4312-4F72";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/d4c2cbd7-9ed6-442b-96a6-75dbeec7458d"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  # Audio
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;
  networking = {
    useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = true;
    networkmanager.enable = true;
  };

}
