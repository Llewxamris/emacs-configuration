;;;; my-flycheck.el
;;;; Package setup for Flycheck
;;; flycheck - On the fly syntax checking for GNU Emacs
;;; https://github.com/flycheck/flycheck
(use-package flycheck
  :ensure t
  ;; Flycheck by default
  :init (global-flycheck-mode)
  :config
  ;; Disable flycheck on checkdoc
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(provide 'my-flycheck)

