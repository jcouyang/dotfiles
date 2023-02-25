{ config, pkgs, ... }:
{
  imports = [./shared-config.nix];
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ libpinyin ];
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
