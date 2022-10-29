{users}:
let home = users.jcouyang.home;
in {
  imports = [ "${builtins.fetchTarball "https://github.com/ryantm/agenix/archive/main.tar.gz"}/modules/age.nix"];
  age.identityPaths = ["${home}/.ssh/id_ed25519"];
  age.secrets = {
    netrc = {
      file = ./.netrc.age;
      path = "${home}/.netrc";
      owner = users.jcouyang.name;
    };
    npmrc = {
      file = ./.npmrc.age;
      path = "${home}/.npmrc";
      owner = users.jcouyang.name;
    };
    "gh/hosts.yml" = {
      file = ./gh_hosts.yaml.age;
      path = "${home}/.config/gh/hosts.yml";
      owner = users.jcouyang.name;
    };
  };
}  
