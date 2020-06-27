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
      echo "linking fish"
      test -e /usr/local/bin/fish || ln -s $out/bin/fish /usr/local/bin/fish
      test -e /usr/local/bin/fasd || ln -s $out/bin/fasd /usr/local/bin/fasd
      '';
    };
  };
}
