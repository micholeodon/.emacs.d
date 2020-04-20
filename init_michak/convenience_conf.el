;; company mode global setting
(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)
(setq company-quickhelp-delay 0)


;; custom misc
(setq isearch-allow-scroll t)
;; save minibuffer history
(savehist-mode 1)
;;(ido-mode 1) ;; not intuitive sometimes
(progn
  ;; minibuffer enhanced completion
  (require 'icomplete)
  (icomplete-mode 1)
  ;; show choices vertically
  ;;(setq icomplete-separator "\n")
  (setq icomplete-hide-common-prefix nil)
  (setq icomplete-in-buffer t)

  (define-key icomplete-minibuffer-map (kbd "<right>") 'icomplete-forward-completions)
  (define-key icomplete-minibuffer-map (kbd "<left>") 'icomplete-backward-completions))


(global-set-key (kbd "C-s") 'swiper)

(setq completion-ignore-case  t)
(setq read-file-name-completion-ignore-case t)
(load "~/Downloads/icomplete+.el")
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(find-file "~/.")

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "M-.")  'mc/mark-next-like-this)
(global-set-key (kbd "M-,")  'mc/unmark-next-like-this)
(global-set-key (kbd"C-S-<mouse-1>") 'mc/add-cursor-on-click)


;; open multiple marked files with 'F' key
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map "F" 'my-dired-find-file)
     (defun my-dired-find-file (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'find-file fn-list)))))


;; prevent from creating backup files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files


;; when goto-line (M-g M-g) it will show corresponding line during input
(global-set-key [remap goto-line] 'goto-line-preview)


;; ace-window for efficient switching
(global-set-key (kbd "C-x o") 'ace-window)
