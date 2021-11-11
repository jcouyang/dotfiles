# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
  };
  nix.trustedUsers = [ "root" "jcouyang" ];
  
  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  networking = {
    useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = true;
    networkmanager.enable = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ libpinyin ];
  };
  fonts.fonts = [ pkgs.jetbrains-mono ];
  fonts.fontconfig.defaultFonts.monospace = [ "JetBrains Mono" ];

  services = {
    # Enable the X11 windowing system.
    xserver.enable = true;
    # Enable the Plasma 5 Desktop Environment.
    xserver.displayManager.sddm.enable = true;
    xserver.desktopManager.plasma5.enable = true;
  };

  # Audio
  hardware.pulseaudio.enable = true;
  sound.enable = true;

  # User
  users.defaultUserShell = pkgs.zsh;
  users.mutableUsers = false;
  users.users.jcouyang = {
    isNormalUser = true;
    home = "/home/jcouyang";
    extraGroups = [ "wheel" "docker" ];
    hashedPassword = "$6$6THp6OqEiW6$Y1ary6ow62pkJELcj3Qcx6bmrE9YJ4WqlEtyFTZPwtN9m2ksFRBey/zW.9W1I5ZhlJMM2kBa9CIqYg3Bx5pfm0";
  };

  environment = {
    shells = [ pkgs.bashInteractive pkgs.zsh ];
    systemPackages = with pkgs; [
      gnupg
      firefox
      keepassxc
      (callPackage ./pkgs/synology.nix {})
    ] ++ (callPackage ./dev-tools.nix {});
  };

  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "z" ];
      theme = "lambda";
    };
  };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

  virtualisation = {
    docker = {
      enable = true;
      autoPrune.dates = "weekly";
      autoPrune.enable = true;
    };
  };
}
