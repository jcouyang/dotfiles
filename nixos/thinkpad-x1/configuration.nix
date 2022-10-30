# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../shared-config.nix
    ];

  services.fprintd.enable = true;
  security.pam.services = {
    login.unixAuth = true;
    # fprint is not stable, locked sometimes after suspend
    login.fprintAuth = false;
    sddm.fprintAuth = false;
    xscreensaver.fprintAuth = true;
    kwallet.fprintAuth = true;
  };
}

