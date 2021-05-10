;; Flycheck ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;; Python ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'python)
;; 
;; ;; change path below if you are using different env 
;; (setq python-shell-interpreter "/home/michak/anaconda2/envs/mne/bin/python")
;; (elpy-enable)
;;(setq python-shell-interpreter "ipython")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Sublimity (minimap included)
;;(require 'sublimity)
;;;; (require 'sublimity-scroll)
;;(require 'sublimity-map) ;; experimental
;;;; (require 'sublimity-attractive)


;; MATLAB mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
 (add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "~/MATLAB/bin/matlab")
(global-set-key (kbd "C-z") 'matlab-shell-run-region-or-line)
;;(setq company-mode t)
(setq company-dabbrev-downcase nil) ;; to prevent from auto-downcase
(defun my-matlab-mode-hook () (setq fill-column 80) (toggle-truncate-lines) (display-line-numbers-mode) (fci-mode))
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;; MARKDOWN ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set markdown rendering to be possible
(setq markdown-command "/usr/bin/pandoc")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;; C ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tab-length, c-indenting
(setq-default tab-width 4)
;;(setq-default c-basic-offset 4)
(setq c-default-style "linux"
          c-basic-offset 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;; GIT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;; LATEX ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; function for changing the latex rendered equation size
(defun latex-font-scale (s)
  (interactive "nInsert scale factor ")
  (plist-put org-format-latex-options :scale s)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; export code with preservig spacing
(setq TeX-auto-untabify 't)


;; BABEL: load language-specific files
;; (based on https://code.orgmode.org/bzg/worg/raw/master/org-contrib/babel/ob-template.el )
(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages 'org-babel-load-languages
                              '((sql . t)
                                (shell . t)
                                (dot . t)
                                (emacs-lisp . t)
                                (ruby . t)
                                (js . t)
								(R . t)
								(ditaa . t)
								(python .t)
								(matlab . t)
                                (plantuml . t)))



;; XPP code highlighting
(load-file "~/.emacs.d/xpp.el")
(autoload 'xpp-mode "xpp" "Enter XPP mode." t)
(setq auto-mode-alist (cons '("\\.ode\\'" . xpp-mode) auto-mode-alist))

;; HTML inline images html export (control size: https://emacs.stackexchange.com/questions/26363/downscaling-inline-images-in-org-mode)
(setq org-image-actual-width nil)

