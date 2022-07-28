{pkgs, ...}:

with pkgs; [
  # General
  (callPackage ./pkgs/emacs.nix {})
  silver-searcher
  fasd
  jq
  ispell
  graphviz
  stow
  awscli
  fzf

  # Github
  git
  git-remote-gcrypt
  gh

  ## Scala
  # graalvm8-ce
  # (ammonite.override {jre = graalvm8-ce; })
  # (sbt.override { jre = graalvm8-ce; })

  # JS
  yarn

  # Haskell
  stack
  ghc
  stylish-haskell
  haskell-language-server
  dhall
  dhall-json
  dhall-bash
  ## 1.1.1 has bug
  # dhall-lsp-server

  # Go
  go_1_18
  gopls

  # Rust
  cargo

  # python
  python39
]
