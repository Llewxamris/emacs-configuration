;;;; my-ibuffer.el
;;;; Package setup for iBuffer
;;; This is a total mess. Save me.
(require 'evil)

(evil-set-initial-state 'ibuffer-mode 'normal)
(eval-after-load 'ibuffer
  (progn
     (general-define-key
			:states 'normal
			:keymaps 'ibuffer-mode-map
      "j" 'evil-next-line
      "k" 'evil-previous-line
      "l" 'ibuffer-visit-buffer
      "v" 'ibuffer-toggle-marks
      "m" 'ibuffer-mark-forward
      "u" 'ibuffer-unmark-forward
      "=" 'ibuffer-diff-with-file
      "J" 'ibuffer-jump-to-buffer
      "M-g" 'ibuffer-jump-to-buffer
      "M-s a C-s" 'ibuffer-do-isearch
      "M-s a M-C-s" 'ibuffer-do-isearch-regexp
      "M-s a C-o" 'ibuffer-do-occur
      "DEL" 'ibuffer-unmark-backward
      "M-DEL" 'ibuffer-unmark-all
      "* *" 'ibuffer-unmark-all
      "* M" 'ibuffer-mark-by-mode
      "* m" 'ibuffer-mark-modified-buffers
      "* u" 'ibuffer-mark-unsaved-buffers
      "* s" 'ibuffer-mark-special-buffers
      "* r" 'ibuffer-mark-read-only-buffers
      "* /" 'ibuffer-mark-dired-buffers
      "* e" 'ibuffer-mark-dissociated-buffers
      "* h" 'ibuffer-mark-help-buffers
      "* z" 'ibuffer-mark-compressed-file-buffers
      "." 'ibuffer-mark-old-buffers

      "d" 'ibuffer-mark-for-delete
      "C-d" 'ibuffer-mark-for-delete-backwards
      "k" 'ibuffer-mark-for-delete
      "x" 'ibuffer-do-kill-on-deletion-marks

      ;; immediate operations
      "n" 'ibuffer-forward-line
      "SPC" 'forward-line
      "p" 'ibuffer-backward-line
      "M-}" 'ibuffer-forward-next-marked
      "M-{" 'ibuffer-backwards-next-marked
      "g" 'ibuffer-update
      "," 'ibuffer-toggle-sorting-mode
      "s i" 'ibuffer-invert-sorting
      "s a" 'ibuffer-do-sort-by-alphabetic
      "s v" 'ibuffer-do-sort-by-recency
      "s s" 'ibuffer-do-sort-by-size
      "s f" 'ibuffer-do-sort-by-filename/process
      "s m" 'ibuffer-do-sort-by-major-mode

      "/ m" 'ibuffer-filter-by-used-mode
      "/ M" 'ibuffer-filter-by-derived-mode
      "/ n" 'ibuffer-filter-by-name
      "/ c" 'ibuffer-filter-by-content
      "/ e" 'ibuffer-filter-by-predicate
      "/ f" 'ibuffer-filter-by-filename
      "/ >" 'ibuffer-filter-by-size-gt
      "/ <" 'ibuffer-filter-by-size-lt
      "/ r" 'ibuffer-switch-to-saved-filters
      "/ a" 'ibuffer-add-saved-filters
      "/ x" 'ibuffer-delete-saved-filters
      "/ d" 'ibuffer-decompose-filter
      "/ s" 'ibuffer-save-filters
      "/ p" 'ibuffer-pop-filter
      "/ !" 'ibuffer-negate-filter
      "/ t" 'ibuffer-exchange-filters
      "/ TAB" 'ibuffer-exchange-filters
      "/ o" 'ibuffer-or-filter
      "/ g" 'ibuffer-filters-to-filter-group
      "/ P" 'ibuffer-pop-filter-group
      "/ D" 'ibuffer-decompose-filter-group
      "/ /" 'ibuffer-filter-disable

      "M-n" 'ibuffer-forward-filter-group
      "\t" 'ibuffer-forward-filter-group
      "M-p" 'ibuffer-backward-filter-group
      [backtab] 'ibuffer-backward-filter-group
      "M-j" 'ibuffer-jump-to-filter-group
      "C-k" 'ibuffer-kill-line
      "C-y" 'ibuffer-yank
      "/ S" 'ibuffer-save-filter-groups
      "/ R" 'ibuffer-switch-to-saved-filter-groups
      "/ X" 'ibuffer-delete-saved-filter-groups
      "/ \\" 'ibuffer-clear-filter-groups

      "% n" 'ibuffer-mark-by-name-regexp
      "% m" 'ibuffer-mark-by-mode-regexp
      "% f" 'ibuffer-mark-by-file-name-regexp

      "C-t" 'ibuffer-visit-tags-table

      "|" 'ibuffer-do-shell-command-pipe
      "!" 'ibuffer-do-shell-command-file
      "~" 'ibuffer-do-toggle-modified
      "A" 'ibuffer-do-view
      "D" 'ibuffer-do-delete
      "E" 'ibuffer-do-eval
      "F" 'ibuffer-do-shell-command-file
      "I" 'ibuffer-do-query-replace-regexp
      "H" 'ibuffer-do-view-other-frame
      "N" 'ibuffer-do-shell-command-pipe-replace
      "M" 'ibuffer-do-toggle-modified
      "O" 'ibuffer-do-occur
      "P" 'ibuffer-do-print
      "Q" 'ibuffer-do-query-replace
      "R" 'ibuffer-do-rename-uniquely
      "S" 'ibuffer-do-save
      "T" 'ibuffer-do-toggle-read-only
      "U" 'ibuffer-do-replace-regexp
      "V" 'ibuffer-do-revert
      "W" 'ibuffer-do-view-and-eval
      "X" 'ibuffer-do-shell-command-pipe

      "w" 'ibuffer-copy-filename-as-kill

      "e" 'ibuffer-visit-buffer
      "f" 'ibuffer-visit-buffer
      "C-x C-f" 'ibuffer-find-file
      "o" 'ibuffer-visit-buffer-other-window
      "C-o" 'ibuffer-visit-buffer-other-window-noselect
      "M-o" 'ibuffer-visit-buffer-1-window
      "C-x v" 'ibuffer-do-view-horizontally
      "C-c C-a" 'ibuffer-auto-mode
      "C-x 4 RET" 'ibuffer-visit-buffer-other-window
      "C-x 5 RET" 'ibuffer-visit-buffer-other-frame)))

(provide 'my-ibuffer)
