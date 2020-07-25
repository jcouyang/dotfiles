{
  nixpkgs.config.allowUnsupportedSystem = true;
  packageOverrides = pkgs: let
      easy_dhall = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-dhall-nix";
    rev = "7c22a145fcb8e00b61d29efc7543af0c80d709ed";
    sha256 = "03qry1wbhyb8i2qz7gcb04hw5d75a4vx2d4xjb6iradj1pc199xg";
      }) {};
      in with pkgs; {
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
        # coursier
        sbt
        # JS
        yarn
        easy_dhall.dhall-simple
        easy_dhall.dhall-lsp-simple
        easy_dhall.dhall-json-simple
      ];
      postBuild = ''
      echo "linking fish"
      test -e /usr/local/bin/fish || ln -s $out/bin/fish /usr/local/bin/fish
      test -e /usr/local/bin/fasd || ln -s $out/bin/fasd /usr/local/bin/fasd
      '';
    };
  };
}
