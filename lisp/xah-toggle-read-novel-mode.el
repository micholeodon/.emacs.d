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
