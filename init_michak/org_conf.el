;; ORG-mode new keywords
(setq org-todo-keywords '((type "TODO" "FOCUS" "|" "DONE")))

(setq org-todo-keyword-faces
 '(("TODO" . "red")
   ("DONE" . "green")
   ("FOCUS" . "yellow")))

;; System locale to use for formatting time values.
(setq system-time-locale "C")         ; Make sure that the weekdays in the
                                      ; time stamps of your Org mode files and
                                      ; in the agenda appear in English.


;; visual-line-mode when opening .org files
(with-eval-after-load 'org       
  (add-hook 'org-mode-hook #'visual-line-mode))


;; toc-org
;;(if (require 'toc-org nil t)
;;    (add-hook 'org-mode-hook 'toc-org-mode)
;;
;;  ;; enable in markdown, too
;;  (add-hook 'markdown-mode-hook 'toc-org-mode)
;;  (define-key markdown-mode-map (kbd "\C-c\C-o") 'toc-org-markdown-follow-thing-at-point))
;;(warn "toc-org not found"))
