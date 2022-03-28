{pkgs, runCommand}:

let
  theEmacs = if pkgs.stdenv.isDarwin then pkgs.emacsMacport else pkgs.emacs;
  emacsWithPackages = pkgs.emacsWithPackages;
  myEmacsConf = runCommand "default.el" {
    src = builtins.path {
      name = "emacsConfigSrc";
      path = ./../.. + "/.emacs.d";
    };
  } ''
      mkdir -p $out/share/emacs/site-lisp
      cp $src/README.org .
      ${theEmacs}/bin/emacs -batch -l org README.org -f org-babel-tangle
      cp README.el $out/share/emacs/site-lisp/default.el
  '';
  myEmacs = emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
    myEmacsConf
    ace-jump-mode
    ag
    company
    company-restclient
    dhall-mode
    expand-region
    flycheck
    go-mode
    haskell-mode
    helm
    helm-ag
    helm-projectile
    helm-swoop
    indent-guide
    json-mode
    jq-mode
    key-chord
    langtool
    lsp-haskell
    lsp-metals
    lsp-mode
    lsp-ui
    magit
    markdown-mode
    multiple-cursors
    nix-mode
    nyan-mode
    ob-restclient
    projectile
    psc-ide
    purescript-mode
    rainbow-delimiters
    restclient
    smartparens
    textmate
    typescript-mode
    unicode-fonts
    use-package
    which-key
    yaml-mode
    yasnippet
    yasnippet-snippets
  ]));
in
myEmacs
