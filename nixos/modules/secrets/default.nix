{lib, config, options, pkgs, ...}:
with lib;
let cfg = config.secrets;
    isDarwin = builtins.hasAttr "darwinConfig" options.environment;
    agenixurl = "https://github.com/montchr/agenix/archive/refs/heads/darwin-support.tar.gz";
in {
  imports = [ "${builtins.fetchTarball agenixurl}/modules/age.nix" ];
  options.secrets = {
    enable = mkEnableOption "mount secrets";
    home = mkOption {type = types.str;};
    owner = mkOption {type = types.str;};
    agenixurl = mkOption {type = types.str; default = "https://github.com/ryantm/agenix/archive/main.tar.gz";};
    identityPaths = mkOption {type = types.listOf types.str;default = [];};
  };
  config = mkIf cfg.enable {
    age.identityPaths = cfg.identityPaths;
    age.secrets = {
      "pulumi/passphase" = {
        file = ./pulumi/passphase.age;
        path = "${cfg.home}/.config/pulumi/passphase";
        owner = cfg.owner;
      };
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
      "gpg/oyanglulu.sec.gpg" = {
        file = ./gpg/oyanglulu.sec.gpg.age;
        owner = cfg.owner;
      };
      "gpg/jichao.sec.gpg" = {
        file = ./gpg/jichao.sec.gpg.age;
        owner = cfg.owner;
      };
    };
  };
}
