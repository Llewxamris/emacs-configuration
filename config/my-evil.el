;;;; my-evill.el
;;;; Package setup for Evil!
;;; evil-leader: <leader> key for evil
;;; https://github.com/cofi/evil-leader
(use-package evil-leader
  :commands (evil-leader-mode)
  :ensure t
  :demand evil-leader
  :init
  ;; Evil-leader by default
  (global-evil-leader-mode)
  :config
  (progn
    ;; Set <leader> to ","
    (evil-leader/set-leader ",")
    ;; Global bindings for evil-leader
    (evil-leader/set-key "w" 'save-buffer)
    (evil-leader/set-key "q" 'delete-window)
    (evil-leader/set-key "h" 'dired-jump)
    (evil-leader/set-key "t" 'dired)
    (evil-leader/set-key "v" 'split-window-right)
    (evil-leader/set-key "," 'other-window)
    (evil-leader/set-key "b" 'ibuffer)
    (evil-leader/set-key "a" 'org-agenda)
    (evil-leader/set-key "c" 'org-capture)))

;;; evil - The extensible vi layer for Emacs.
;;; https://github.com/emacs-evil/evil
(use-package evil
  :ensure t
  :config
  (progn
    ;; Evil by default
    (evil-mode 1)
    ;; Change windows using Ctrl-[hjkl]
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))

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
