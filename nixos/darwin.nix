{ config, pkgs, buildtins, ... }: rec {
  imports = [
    ./shared-config.nix
    ./modules/darwin/services/ollama.nix
  ];
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

  nix.settings.substituters = [ "https://cache.nixos.org" ];
  services.ollama = {
    enable = true;
    environmentVariables = {
      OLLAMA_CONTEXT_LENGTH="128000";
      OLLAMA_KEEP_ALIVE="1h";
      OLLAMA_NO_CLOUD="1";
    };
  };
}
