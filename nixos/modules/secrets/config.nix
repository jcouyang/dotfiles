{pkgs,lib, config, ...}:
with lib;
let cfg = config.secrets;
in {
  imports = [ "${builtins.fetchTarball "https://github.com/ryantm/agenix/archive/main.tar.gz"}/modules/age.nix" ];
  options.secrets = {
    enable = mkEnableOption "mount secrets";
    home = mkOption {type = types.str;};
    owner = mkOption {type = types.str;};
    identityPaths = mkOption {type = types.listOf types.str;default = [];};
  };
  config = mkIf cfg.enable {
    age.identityPaths = cfg.identityPaths;
    age.secrets = {
      netrc = {
        file = ./.netrc.age;
        path = "${cfg.home}/.netrc";
        owner = cfg.owner;
      };
      npmrc = {
        file = ./.npmrc.age;
        path = "${cfg.home}/.npmrc";
        owner = cfg.owner;
      };
      "gh/hosts.yml" = {
        file = ./gh_hosts.yaml.age;
        path = "${cfg.home}/.config/gh/hosts.yml";
        owner = cfg.owner;
      };
      "offlineimap/gmailpass" = {
        file = ./offlineimap/gmailpass.age;
        owner = cfg.owner;
      };
    };
  };
}
