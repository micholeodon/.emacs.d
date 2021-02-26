;; load theme
;;(load-theme 'bubbleberry)
(load-theme 'wheatgrass)

;; some initial tweaks
(toggle-truncate-lines t)
(tool-bar-mode -1)

;; column-number-mode
(setq column-number-mode t)

;; rule
(require 'fill-column-indicator)

;; human readable dired
(setq dired-listing-switches "-alh") 


;; highlighting (conflict keybinding with macro)
;; (require 'highlight-symbol)
;; (global-set-key [f3] 'highlight-symbol)
;; (global-set-key [(control f3)] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)


;; shine curson when scrolling (beacon-mode)
(beacon-mode 1)


;; dimmer (dims non-active buffers to help focus on current buffer)
 (require 'dimmer)
 (dimmer-configure-which-key)
 (dimmer-configure-helm)
 (dimmer-mode t)
 (setq dimmer-fraction 0.3)


;; color of org-header
(custom-theme-set-faces 'user
                        `(org-level-1 ((t (:foreground "spring green")))))

;;; change org bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; substitute to org-bullets.el
;;(defcustom org-bullets-bullet-list
;;  '(;;; Large
;;    ;;"◉"
;;    ;;"○"
;;    ;;"✸"
;;    ;;"✿"
;;	"①"
;;	"②"
;;	"③"
;;	"④"
;;	"⑤"
;;	"⑥"
;;	"⑦"
;;    ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶
;;    ;;; Small
;;    ;; ► • ★ ▸
;;    )
;;  "This variable contains the list of bullets.
;;It can contain any number of symbols, which will be repeated."
;;  :group 'org-bullets
;;  :type '(repeat (string :tag "Bullet character")))


;; hide unnecessary clutter
(scroll-bar-mode 0)
(tool-bar-mode 0)
;;(menu-bar-mode 0)


(defun xah-toggle-read-novel-mode ()
  "Setup current frame to be suitable for reading long novel/article text.
• Set frame width to 70
• Line wrap at word boundaries.
• Line spacing is increased.
• Proportional width font is used.
Call again to toggle back.
URL `http://ergoemacs.org/emacs/emacs_novel_reading_mode.html'
Version 2019-01-30 2021-01-16"
  (interactive)
  (if (eq (frame-parameter (selected-frame) 'width) 70)
      (progn
        (set-frame-parameter (selected-frame) 'width 106)
        (variable-pitch-mode 0)
        (setq line-spacing nil)
        (setq word-wrap nil))
    (progn
      (set-frame-parameter (selected-frame) 'width 70)
      (variable-pitch-mode 1)
      (setq line-spacing 0.5)
      (setq word-wrap t)))
  (redraw-frame (selected-frame)))

(defun xah-toggle-margin-right ()
  "Toggle the right margin between `fill-column' or window width.
This command is convenient when reading novel, documentation.
URL `http://ergoemacs.org/emacs/emacs_novel_reading_mode.html'
Version 2020-04-10"
  (interactive)
  (if (cdr (window-margins))
      (set-window-margins nil 0 0)
    (set-window-margins nil 0 (- (window-body-width) fill-column))))
