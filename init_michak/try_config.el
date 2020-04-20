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
