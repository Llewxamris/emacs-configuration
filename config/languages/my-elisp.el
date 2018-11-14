;;; elisp-slime-nav - Slime-style navigation of Emacs Lisp
;;; https://github.com/purcell/elisp-slime-nav
(use-package elisp-slime-nav
  :ensure t
  :config
  (progn
    (add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)))

(progn
  (evil-leader/set-key-for-mode 'emacs-lisp-mode "e" 'pp-eval-last-sexp))

(provide 'my-elisp)
