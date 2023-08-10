{ config, pkgs, ... }:
{
  imports = [./shared-config.nix];
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ libpinyin ];
  };
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

  # User
  users.users.jcouyang = {
    name = "jcouyang";
    isNormalUser = true;
    home = "/home/jcouyang";
    extraGroups = [ "wheel" "podman" "audio" ];
    hashedPassword = "$6$6THp6OqEiW6$Y1ary6ow62pkJELcj3Qcx6bmrE9YJ4WqlEtyFTZPwtN9m2ksFRBey/zW.9W1I5ZhlJMM2kBa9CIqYg3Bx5pfm0";
    shell = pkgs.zsh;
  };

  users.mutableUsers = false;
  fonts.fontconfig.defaultFonts.monospace = [ "JetBrains Mono" ];

  services = {
    # Enable the X11 windowing system.
    xserver.enable = true;
    # Enable the Plasma 5 Desktop Environment.
    xserver.displayManager.sddm.enable = true;
    xserver.desktopManager.plasma5.enable = true;
    xserver.xkbOptions = "caps:ctrl_modifier";

  };

  virtualisation = {
    docker.enable = false;
    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
      defaultNetwork.dnsname.enable = true;
    };
  };

  system.stateVersion = "22.11";
}
