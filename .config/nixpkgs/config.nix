{
  nixpkgs.config.allowUnsupportedSystem = true;
  packageOverrides = pkgs: with pkgs; {
    oyanglulu = pkgs.buildEnv {
      name = "oyanglulu-pkgs";
      meta = {
        priority = 10;
      };
      paths = [
        fish
        silver-searcher
        fasd
        jq
        ispell
        graphviz
        stow
        # Github
        gitAndTools.hub
        gitAndTools.gh
        # Scala
        ammonite
        coursier
        sbt
        # JS
        yarn
      ];
      postBuild = ''
      echo "yay"
      '';
    };
  };
}
