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
     :states 'normal
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
      "e" 'eval-last-sexp)
    ;; Org-mode <leader> bindings
    (my-leader-def
      :states 'normal
      :keymaps 'org-mode-map
      "x" 'org-todo
      "y" 'org-todo-yesterday
      "s" 'org-schedule
      "d" 'org-deadline)))

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
