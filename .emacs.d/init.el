(require 'cask "~/.cask/cask.el")
(cask-initialize)
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (package-initialize)
;; (package-install 'use-package)
;; (require 'use-package)
(require 'org)
(setq org-confirm-babel-evaluate nil
      vc-follow-symlinks nil)
(setq load-prefer-newer t)
(org-babel-load-file "~/.emacs.d/README.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-enable-file-watchers nil)
 '(org-latex-classes
   '(("article" "\\documentclass[11pt]{article}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("tufte" "\\documentclass{tufte-book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
 '(org-latex-default-packages-alist
   '(("AUTO" "inputenc" t
      ("pdflatex"))
     ("T1" "fontenc" t
      ("pdflatex"))
     ("" "graphicx" t nil)
     ("" "longtable" nil nil)
     ("" "wrapfig" nil nil)
     ("" "rotating" nil nil)
     ("normalem" "ulem" t nil)
     ("" "amsmath" t nil)
     ("" "textcomp" t nil)
     ("" "amssymb" t nil)
     ("" "capt-of" nil nil)
     ("" "hyperref" nil nil)))
 '(org-latex-listings t)
 '(org-plantuml-jar-path "/usr/local/bin/plantuml.jar")
 '(package-selected-packages
   (quote
    (org-crypt ob-restclient company-restclient restclient ox-leanpub ox-gfm ox-rst idris-mode dhall-mode htmlize purescript-mode ob-http haskell-mode ghub thrift psc-ide typescript-mode git-link nix-mode yasnippet-snippets company-lsp lsp-ui helm-swoop rust-mode yaml-mode web-mode visual-regexp use-package unicode-fonts smartparens rainbow-mode pallet ox-tufte on-screen nyan-mode multiple-cursors markdown-mode langtool key-chord json-mode js2-mode indent-guide iedit helm-projectile helm-ag fasd expand-region dracula-theme ag ace-jump-mode)))
 '(tex-run-command "xelatex"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
