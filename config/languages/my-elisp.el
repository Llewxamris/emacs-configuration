;;;; my-elisp.el
;;;; Package setup for the Emacs Lisp language
;;; elisp-slime-nav - Slime-style navigation of Emacs Lisp
;;; https://github.com/purcell/elisp-slime-nav
(use-package elisp-slime-nav
  :ensure t
  :config
  (progn
    ;; Hook to Elisp mode
		(add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
		;; Use <leader>e to evaluate s-expressions
		(general-define-key
		 :states 'normal
		 "e" 'pp-eval-last-sexp)))

(provide 'my-elisp)
