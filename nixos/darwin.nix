{ config, pkgs, buildtins, ... }: rec {
  imports = [./shared-config.nix];
  # User
  users.users.jcouyang = {
    name = "Jichao.Ouyang";
    home = "/Users/jichao.ouyang";
  };

#  services.nix-daemon.enable = true; # 
#  services.offlineimap.path = [pkgs.bash pkgs.notmuch];
#  services.offlineimap.extraConfig = builtins.readFile (users.users.jcouyang.home + "/.offlineimaprc");
  system.stateVersion = 5;
  system.primaryUser = "Jichao.Ouyang";
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;

  nix.settings.substituters = [ "https://cache.nixos.org" ]
}
