(defun xah-toggle-margin-right ()
  "Toggle the right margin between `fill-column' or window width.
This command is convenient when reading novel, documentation.
URL `http://ergoemacs.org/emacs/emacs_novel_reading_mode.html'
Version 2020-04-10"
  (interactive)
  (if (cdr (window-margins))
      (set-window-margins nil 0 0)
    (set-window-margins nil 0 (- (window-body-width) fill-column))))
