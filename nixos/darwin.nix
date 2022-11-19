{ config, pkgs, buildtins, ... }: rec {
  imports = [./shared-config.nix];
  # User
  users.users.jcouyang = {
    name = "jichao.ouyang";
    home = "/Users/jichao.ouyang";
  };

  services.nix-daemon.enable = true;
  services.offlineimap.path = [pkgs.bash pkgs.notmuch];
  services.offlineimap.extraConfig = builtins.readFile (users.users.jcouyang.home + "/.offlineimaprc");
  system.stateVersion = 4;
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;
}
