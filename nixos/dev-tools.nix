{pkgs}:

with pkgs; [
  # General
  (import ./emacs.nix { inherit pkgs; })
  silver-searcher
  fasd
  jq
  ispell
  graphviz
  stow
  # Github
  git
  gitAndTools.hub
  gh
  # Scala
  graalvm8-ce
  (ammonite.override {jre = graalvm8-ce; })
  (sbt.override { jre = graalvm8-ce; })
  # JS
  yarn
  # Haskell
  stack
  stylish-haskell
  dhall
  dhall-json
  dhall-bash
  dhall-lsp-server
  # Rust
  cargo
  # python
  python38
]
