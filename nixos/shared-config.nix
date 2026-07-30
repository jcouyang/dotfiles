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
    distributedBuilds = true;
    settings = {
      tarball-ttl = 60*24*30;
      experimental-features = [ "nix-command" "flakes" ];
      trusted-substituters = ["https://jcouyang.cachix.org" "https://cache.iog.io"];
      trusted-public-keys = [
      "myob-api-nix-cache:2r+2/m5vOo/6PI1PTas0wc7OtVLv4wYXE9u3t8CEr4I="
      "jcouyang.cachix.org-1:TsD057OCpomDztwQiONvnXfLnOaGDhOAAB3C8ODLr14="
      "cache.dhall-lang.org:I9/H18WHd60olG5GsIjolp7CtepSgJmM2CsO813VTmM="
      "dhall.cachix.org-1:8laGciue2JBwD49ICFtg+cIF8ddDaW7OFBjDb/dHEAo="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      ];
      substituters = ["https://jcouyang.cachix.org" "https://cache.dhall-lang.org" "https://dhall.cachix.org" "https://cache.iog.io"];
      trusted-users = [ "root" "Jichao.Ouyang" ];
    };
    buildMachines = [ {
	    hostName = "192.168.1.33";
	    system = "x86_64-linux";
	    maxJobs = 4;
	    speedFactor = 2;
      sshUser = "jcouyang";
      sshKey = "${config.users.users.jcouyang.home}/.ssh/id_ed25519";
	    supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
	    mandatoryFeatures = [ ];
	  }] ;
  };
  fonts.packages = [ pkgs.jetbrains-mono pkgs.et-book ];
  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  services = { 
    offlineimap.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
#      synology-drive-client
      #      notmuch
      # gnupg
      (pkgs.callPackage "${builtins.fetchTarball "https://github.com/ryantm/agenix/archive/main.tar.gz"}/pkgs/agenix.nix" {})
    ]
    ++ lib.optional stdenv.isLinux (callPackage ./pkgs/firefox.nix {});
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
