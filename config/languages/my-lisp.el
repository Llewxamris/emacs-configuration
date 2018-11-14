;;;; my-lisp.el
;;;; Package setup for the (C)Lisp programming language
;;; slime - The Superior Lisp Interaction Mode for Emacs
;;; https://github.com/slime/slime
(use-package slime
  :ensure t
  :config
  (progn
    ;; Use fancy REPL
    (setq slime-contribs '(slime-fancy))
    ;; Use sbcl as the inferior lisp program
    (setq inferior-lisp-program "/usr/bin/sbcl")
    ;; Use <leader>e to evaluate defun statements in SLIME
    (evil-leader/set-key-for-mode 'lisp-mode "e" 'slime-eval-defun)
    ;; Use NORMAL mode in the SLIME REPLT
    (evil-set-initial-state 'slime-repl-mode 'normal)
    ;; Auto-start SLIME
    (add-hook 'lisp-mode-hook 'slime)))

(provide 'my-lisp)
