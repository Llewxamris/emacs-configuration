;;; slime - The Superior Lisp Interaction Mode for Emacs
;;; https://github.com/slime/slime
(use-package slime
  :ensure t
  :config
  (progn
    (setq slime-contribs '(slime-fancy))
    (setq inferior-lisp-program "/usr/bin/sbcl")
    (evil-leader/set-key-for-mode 'lisp-mode "e" 'slime-eval-defun)
    (evil-set-initial-state 'slime-repl-mode 'normal)
    (add-hook 'lisp-mode-hook 'slime)))

(provide 'my-lisp)
