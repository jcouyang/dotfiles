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
        graalvm8-ce
        (ammonite.override {jre = graalvm8-ce; })
        # coursier
        (sbt.override { jre = graalvm8-ce; })
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
