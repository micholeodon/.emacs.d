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

;; copy target destination is vertical neighbour buffer
;; source: https://emacs.stackexchange.com/questions/5603/how-to-quickly-copy-move-file-in-emacs-dired
(setq dired-dwim-target t)


;; fixing mark point mark region conflict
;; (source : https://www.masteringemacs.org/article/fixing-mark-commands-transient-mark-mode)

(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
   Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))

(global-set-key (kbd "C-`") 'push-mark-no-activate)

(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
  This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))
(global-set-key (kbd "M-`") 'jump-to-mark)


(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))
(define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)



;; switch async command keymap
(global-set-key (kbd "M-&") 'shell-command)
(global-set-key (kbd "M-!") 'async-shell-command)

;; prevent async-shell0-command window split
(add-to-list 'display-buffer-alist
  (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))
