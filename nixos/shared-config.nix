# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

rec {
  imports = (import ./modules/module-list.nix);

  devtools.enable = true;

  secrets = {
    enable = true;
    owner = config.users.users.jcouyang.name;
    home = config.users.users.jcouyang.home;
    identityPaths = ["${config.users.users.jcouyang.home}/.ssh/id_ed25519"];
  };

  nixpkgs = {
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-substituters = ["https://jcouyang.cachix.org" "https://cache.iog.io" "s3://myob-api-nixpkgs?region=ap-southeast-2"];
      trusted-public-keys = [
      "myob-api-nix-cache:2r+2/m5vOo/6PI1PTas0wc7OtVLv4wYXE9u3t8CEr4I="
      "jcouyang.cachix.org-1:TsD057OCpomDztwQiONvnXfLnOaGDhOAAB3C8ODLr14="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      ];
      substituters = ["https://jcouyang.cachix.org" "https://cache.iog.io"];
    };
  };

  fonts.fonts = [ pkgs.jetbrains-mono pkgs.etBook ];
  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  services = {
    offlineimap.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      synology-drive-client
      notmuch
      (pkgs.callPackage "${builtins.fetchTarball "https://github.com/ryantm/agenix/archive/main.tar.gz"}/pkgs/agenix.nix" {})
    ]
    ++ lib.optional stdenv.isLinux (callPackage ./pkgs/firefox.nix {});
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
