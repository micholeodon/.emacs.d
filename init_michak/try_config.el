;; recent files
;;(recentf-mode 1)
;;(setq recentf-max-menu-items 100)
;;(setq recentf-max-saved-items 100)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; periodically update list of recent files
;;(run-at-time nil (* 5 60) 'recentf-save-list)



;; always open files in read-only mode (C-x C-q to toggle)
;;(add-hook 'find-file-hook (lambda () (setq buffer-read-only t)))


;; projectile
;;(require 'projectile)
;;(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;(projectile-mode +1)


;; helm
;;(helm-mode 1)
;;(global-set-key (kbd "M-x") 'helm-M-x)
;;(global-set-key (kbd "C-x C-f") 'helm-find-files)


;; f3 (file finder)
(setq f3-default-directory "/")


;; diff-hl (display status of git, SVN, etc. in dired + integration with magit)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode) ;; source: https://emacs.stackexchange.com/questions/9503/how-can-i-visualize-vcs-status-in-dired/9552#9552
;; source: https://github.com/dgutov/diff-hl
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
