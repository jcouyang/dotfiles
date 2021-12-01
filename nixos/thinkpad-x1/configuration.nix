# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common.nix
    ];
  services.fprintd.enable = true;
  security.pam.services = {
    login.unixAuth = true;
    login.fprintAuth = true;
    xscreensaver.fprintAuth = true;
    kwallet.fprintAuth = true;
  };
}

