{pkgs, runCommand}:

let
  theEmacs = if pkgs.stdenv.isDarwin then pkgs.emacsMacport else pkgs.emacs;
  # theEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesFor theEmacs).emacsWithPackages;
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
    ace-jump-mode
    ag
    age
    company
    company-restclient
    dhall-mode
    direnv
    epkgs.eat
    expand-region
    flycheck
    go-mode
    haskell-mode
    helm
    helm-ag
    helm-projectile
    helm-swoop
    indent-guide
    jq-mode
    json-mode
    key-chord
    langtool
    lsp-haskell
    lsp-metals
    lsp-mode
    lsp-ui
    magit
    markdown-mode
    multiple-cursors
    myEmacsConf
    nix-mode
    notmuch
    nyan-mode
    ob-restclient
    org-bullets
    org-roam
    ox-hugo
    projectile
    protobuf-mode
    psc-ide
    purescript-mode
    rainbow-delimiters
    restclient
    restclient-helm
    restclient-jq
    smartparens
    svelte-mode
    textmate
    typescript-mode
    unicode-fonts
    epkgs.use-package
    vterm
    web-mode
    which-key
    yaml-mode
    yasnippet
    yasnippet-snippets
    zig-mode
  ]));
in
myEmacs
