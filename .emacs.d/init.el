
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'org)
(setq org-confirm-babel-evaluate nil
      vc-follow-symlinks nil)

(org-babel-load-file "~/.emacs.d/README.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-enable-file-watchers nil)
 '(org-plantuml-jar-path "/usr/local/bin/plantuml.jar")
 '(package-selected-packages
   (quote
    (htmlize purescript-mode ob-http haskell-mode ghub thrift psc-ide typescript-mode git-link nix-mode yasnippet-snippets company-lsp lsp-ui helm-swoop rust-mode yaml-mode web-mode visual-regexp use-package unicode-fonts smartparens rainbow-mode pallet ox-tufte on-screen nyan-mode multiple-cursors markdown-mode langtool key-chord json-mode js2-mode indent-guide iedit helm-projectile helm-ag fasd expand-region dracula-theme ag ace-jump-mode)))
 '(tex-run-command "xelatex"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
