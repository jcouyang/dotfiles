{
  packageOverrides = pkgs: with pkgs;
    let myjre = if builtins.currentSystem == "x86_64-darwin" then jre else graalvm8-ce;
    in {
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
        myjre
        (ammonite.override {jre = myjre; })
        # coursier
        (sbt.override { jre = myjre; })
        # JS
        yarn
        dhall
        dhall-json
      ];
    };
    mytex = texlive.combine {
      inherit (texlive)
        collection-langchinese
        collection-xetex
        collection-fontutils
        collection-latexrecommended
        tufte-latex
        xkeyval
        hardwrap
        catchfile ifmtarg pdftexcmds
        titlesec
        capt-of ucs wrapfig units
      ;
    };
  };
}
