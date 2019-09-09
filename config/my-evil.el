;;;; my-evil.el
;;;; Package setup for Evil!
;;; general - More convenient key definitions in emacs
;;; https://github.com/noctuid/general.el
 (use-package general
  :ensure t
	:config
    ;; Org-agenda <leader> bindings
    ;; Org-agenda requires redefining some of the global keys to work
    ;; properly. I've only included those global keys that would make
    ;; sense within the context of the agenda.
    (general-define-key
      :states 'motion
			:prefix ","
      :keymaps 'org-agenda-mode-map
      "s" 'org-agenda-schedule
      "d" 'org-agenda-deadline
      "," 'other-window
      "t" 'dired
      "v" 'split-window-right
      "h" 'split-window-below
      "b" 'ibuffer))

(provide 'my-evil)
