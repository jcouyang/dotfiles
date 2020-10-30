{
  packageOverrides = pkgs: with pkgs; {
    oyanglulu = pkgs.buildEnv {
      name = "oyanglulu-env";
      meta = {
        priority = 10;
      };
      paths = [
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
        # coursier
        sbt
        # JS
        yarn
        dhall
        dhall-json
      ];
    };
    mytex = texlive.combine {
      inherit (texlive) collection-langchinese collection-xetex;
    };
  };
}
