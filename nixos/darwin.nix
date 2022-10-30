{ config, pkgs, ... }:{
  imports = [./shared-config.nix];
  # User
  users.users.jcouyang = {
    name = "jichao.ouyang";
    home = "/Users/jichao.ouyang";
  };
  services.nix-daemon.enable = true;

  system.stateVersion = 4;
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;
}
