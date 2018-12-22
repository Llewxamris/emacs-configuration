;;;; my-evil.el
;;;; Package setup for Evil!
;;; general - More convenient key definitions in emacs
;;; https://github.com/noctuid/general.el
(use-package general
  :ensure t
  :config
  (progn
    ;; Set <leader> to ","
    (general-create-definer my-leader-def
      :prefix ",")
    ;; Global evil keybindings
    (general-define-key
     :states '(normal motion)
     "C-h" 'evil-window-left
     "C-j" 'evil-window-bottom
     "C-k" 'evil-window-up
     "C-l" 'evil-window-right)
    ;; Global <leader> bindings
    (my-leader-def
      :keymaps 'normal
      "w" 'save-buffer
      "q" 'delete-window
      "g" 'dired-jump
      "t" 'dired
      "v" 'split-window-right
      "h" 'split-window-below
      "," 'other-window
      "b" 'ibuffer
      "a" 'org-agenda
      "c" 'org-capture
      "e" 'eval-last-sexp
      "z" 'flyspell-correct-previous-word-generic)
    ;; Org-mode <leader> bindings
    (my-leader-def
      :states 'normal
      :keymaps 'org-mode-map
      "x" 'org-todo
      "y" 'org-todo-yesterday
      "s" 'org-schedule
      "d" 'org-deadline
      "r" 'org-refile)
    ;; Org-agenda <leader> bindings
    ;; Org-agenda requires redefining some of the global keys to work
    ;; properly. I've only included those global keys that would make
    ;; sense within the context of the agenda.
    (my-leader-def
      :states 'motion
      :keymaps 'org-agenda-mode-map
      "x" 'org-agenda-todo
      "y" 'org-agenda-todo-yesterday
      "s" 'org-agenda-schedule
      "d" 'org-agenda-deadline
      "q" 'delete-window
      "," 'other-window
      "t" 'dired
      "v" 'split-window-right
      "h" 'split-window-below
      "b" 'ibuffer
      "c" 'org-capture)))

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
