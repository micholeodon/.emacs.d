;; load theme
(load-theme 'bubbleberry)

;; some initial tweaks
(toggle-truncate-lines t)
(tool-bar-mode -1)

;; column-number-mode
(setq column-number-mode t)

;; rule
;(require 'fill-column-indicator)

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
