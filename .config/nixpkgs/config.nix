{
  allowUnfree = true;
  allowBroken = true;
  packageOverrides = pkgs: with pkgs;
    let myjre = graalvm8-ce;
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
        gh
        # Scala
        myjre
        (ammonite.override {jre = myjre; })
        (sbt.override { jre = myjre; })
        # JS
        yarn
        # Haskell
        stack
        haskell.compiler.ghc884
        stylish-haskell
        dhall
        dhall-json
        dhall-bash
        dhall-lsp-server
        # Rust
        cargo
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
