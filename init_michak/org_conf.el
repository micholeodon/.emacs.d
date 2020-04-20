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
