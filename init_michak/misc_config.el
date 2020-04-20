;; Convenient package handling in emacs

(require 'package)
;; use packages from marmalade
;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;; and the old elpa repo
(add-to-list 'package-archives '("elpa-old" . "http://tromey.com/elpa/"))
;; and automatically parsed versiontracking repositories.
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; melpa stable
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; OLD PACKAGE MANAGE
;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))


;; default programs to open 
(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "okular" (file))))

;;(require 'openwith)
;;(openwith-mode t)
;;(setq openwith-associations '(("\\.docx\\'" "libreoffice" (file))))
;;
;;(require 'openwith)
;;(openwith-mode t)
;;(setq openwith-associations '(("\\.doc\\'" "libreoffice" (file))))
;;

;; terminals?
(defvar server-buffer-clients)
(when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
  (server-start)
  (defun fp-kill-server-with-buffer-routine ()
    (and server-buffer-clients (server-done)))
  (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))



;; multiple terminals hack (unique name in each buffer)
(defun termi ()
    (interactive)
    (require 'multi-term)
    (command-execute 'multi-term)
    (setq-default truncate-lines nil)
    (if (not (boundp 'term-number))
        (defvar term-number 1 "term index in the current emacs session") )
    (rename-buffer (concat "Term " (int-to-string term-number)))
    (setq term-number (+ 1 term-number)))
(global-set-key (kbd "C-S-t") 'termi)

(require 'multi-term)
(add-to-list 'term-bind-key-alist '("C-z" . term-stop-subjob))





;; increments and decrements
(defun my-increment-number-decimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789")
        (when (re-search-forward "[0-9]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 10) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 10 field-width) answer)))
          (replace-match (format (concat "%0" (int-to-string field-width) "d")
                                 answer)))))))

(global-set-key (kbd "C-c +") 'my-increment-number-decimal)

(defun my-decrement-number-decimal (&optional arg)
  (interactive "p*")
  (my-increment-number-decimal (if arg (- arg) -1)))


(defun my-increment-number-hexadecimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer hex-format)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789abcdefABCDEF")
        (when (re-search-forward "[0-9a-fA-F]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 16) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 16 field-width) answer)))
          (if (equal (match-string 0) (upcase (match-string 0)))
              (setq hex-format "X")
            (setq hex-format "x"))
          (replace-match (format (concat "%0" (int-to-string field-width)
                                         hex-format)
                                 answer)))))))

(defun my-format-bin (val width)
  "Convert a number to a binary string."
  (let (result)
    (while (> width 0)
      (if (equal (mod val 2) 1)
          (setq result (concat "1" result))
        (setq result (concat "0" result)))
      (setq val (/ val 2))
      (setq width (1- width)))
    result))

(defun my-increment-number-binary (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "01")
        (when (re-search-forward "[0-1]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 2) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 2 field-width) answer)))
          (replace-match (my-format-bin answer field-width)))))))


;; system monitor
(require 'symon)
(symon-mode)

