;; Michal Konrad Komorowski, August 2019
;; modular emacs config.


(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
	("38143778a2b0b81fb7c7d0e286e5b0e27cd6b2ba1c3b0aa4efbc33e6ac2ed482" "2229862b727e0caa3b0a53152ef82d37819324bf5d2c657f859b2b0a475b34f7" default)))
 '(inhibit-startup-screen t)
 '(isearch-allow-scroll t)
 '(package-selected-packages
   (quote
	(ess fill-column-indicator sublimity htmlize treemacs epresent pdf-tools ace-window eyebrowse symon org-bullets goto-line-preview dimmer beacon hideshow-org dumb-jump highlight-symbol calfw-org org-preview-html plantuml-mode elpy yasnippet-classic-snippets ag flycheck multi-term helm swiper auto-highlight-symbol projectile wc-mode restart-emacs paradox multiple-cursors minimap matlab-mode markdown-mode magit haskell-mode dired-narrow company-quickhelp company-anaconda cl-libify cl-lib-highlight)))
 '(paradox-github-token t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:foreground "dark orange"))))
 '(minimap-active-region-background ((t (:background "dark olive green"))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#f6f3e8" :family "Sans Serif" :height 2.0 :underline nil))))
 '(org-level-1 ((t (:foreground "aquamarine" :weight bold)))))


;; LOAD CUSTOM CONFIG FILES
(load "~/.emacs.d/init_michak/org_conf.el")
(load "~/.emacs.d/init_michak/programming_conf.el")
(load "~/.emacs.d/init_michak/try_config.el")
(load "~/.emacs.d/init_michak/convenience_conf.el")
(load "~/.emacs.d/init_michak/misc_config.el")
(load "~/.emacs.d/init_michak/visual_conf.el")

;; additional .el files
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/emacs-htmlize/")

;;(load "ido-ubiquitous")












