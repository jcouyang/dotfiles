{
  allowUnfree = true;
  allowBroken = true;
  packageOverrides = pkgs: {
    oyanglulu = pkgs.buildEnv {
      name = "oyanglulu-env";
      meta = {
        priority = 10;
      };
      paths = import ../../nixos/dev-tools.nix { inherit pkgs; };
    };
  };
}
