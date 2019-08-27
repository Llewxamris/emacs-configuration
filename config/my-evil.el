;;;; my-evil.el
;;;; Package setup for Evil!
;;; general - More convenient key definitions in emacs
;;; https://github.com/noctuid/general.el
 (use-package general
  :ensure t
	:config
		;; File manipulation bindings
		(general-define-key
		 :states 'normal
		 :prefix "SPC f"
		 "w" 'save-buffer
		 "r" 'find-file)

		;; Buffer creation bindings. These bindings focus on opening special
		;; buffers, not on closing/modifying existing ones
		(general-define-key
		 :states 'normal
		 :prefix "SPC b"
		 "b" 'ibuffer
		 "d" 'dired
		 "D" 'dired-jump)

    ;; Obsolete, need to be refactored out
		(general-define-key
		 :states 'normal
		 :prefix "SPC"
		 "SPC" 'other-window
		 "e" 'eval-last-sexp
		 "z" 'flyspell-correct-previous-word-generic)
    
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

;;; evil - The extensible vi layer for Emacs.
;;; https://github.com/emacs-evil/evil
(use-package evil
  :ensure t
  :config
  (progn
    ;; Evil by default
    (evil-mode 1)))

;;; evil-cleverparens: Evil normal-state minor-mode for editing lisp-like languages.
;;; https://github.com/luxbock/evil-cleverparens
(use-package evil-cleverparens
  :ensure t
  :config
  (progn
    ;; Hook onto Lisp and Elisp modes
    (add-hook 'lisp-mode-hook 'evil-cleverparens-mode)
    (add-hook 'emacs-lisp-mode-hook 'evil-cleverparens-mode)))

;;; evil-commentary: Comment stuff out. A port of vim-commentary
;;; https://github.com/linktohack/evil-commentary
(use-package evil-commentary
  :ensure t
  :config
  (progn
    ;; Enable by default
    (evil-commentary-mode)))

(provide 'my-evil)
