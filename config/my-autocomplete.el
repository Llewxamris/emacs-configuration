;;;; my-autocomplete.el
;;;; Package setup for code-completion
;;; company: Modular in-buffer completion framework for Emacs
;;; http://company-mode.github.io/
(use-package company
  :ensure t
  :config
  (progn
    ;; Always enable Company
    (add-hook 'after-init-hook 'global-company-mode)
    ;; Move through the Company popup using Ctrl-[jk]
    ;; Works while in INSERT mode
    (evil-define-key 'insert 'company-active-map
      (kbd "C-j") 'company-select-next
      (kbd "C-k") 'company-select-previous)))

;;; yasnippet: A template system for Emacs
;;; https://github.com/joaotavora/yasnippet
(use-package yasnippet
  :ensure t
  :config
  (progn
    ;; Always enable
    (yas-global-mode 1)))

;;; yasnippet-snippets: a collection of yasnippet snippets for many languages
;;; https://github.com/AndreaCrotti/yasnippet-snippets
(use-package yasnippet-snippets
  :ensure t)

(provide 'my-autocomplete)
