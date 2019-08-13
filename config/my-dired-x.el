;;;; my-dired-x.el
;;;; Package setup for navigating the local filesystem
;; Do not prompt
(put 'dired-find-alternate-file 'disabled nil)

;;; Define how the filesystem is displayed
;; -k :: Default to 1024-byte blocks for disk usage
;; -a :: Do not ignore entries starting with .
;; -B :: Do not list implied entires ending with ~
;; -h :: Human readable sizes
;; -l :: Use a long listing format
(setq dired-listing-switches "-kaBhl --group-directories-first")

;;; dired-x
(use-package dired-x
  :config
  (progn
    ;; Ranger-like key bindings
		(general-define-key
		 :states 'normal
		 :keymaps 'dired-mode-map
		 "l" 'dired-find-alternate-file
		 "h" 'my-dired-up-directory
		 "o" 'dired-sort-toggle-or-edit
		 "v" 'dired-toggle-marks
		 "m" 'dired-mark
		 "u" 'dired-unmark
		 "U" 'dired-unmark-all-marks
		 "c" 'dired-create-directory
		 "n" 'evil-search-next
		 "N" 'evil-search-previous
		 "q" 'kill-this-buffer)))

(provide 'my-dired-x)
