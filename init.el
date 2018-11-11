;; Setup package management
(require 'package)
(setq load-prefer-newer t)
(package-initialize)
(setq package-enable-at-startup nil)

(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))
(add-to-list 'load-path (concat user-emacs-directory "packages"))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9fcac3986e3550baac55dc6175195a4c7537e8aa082043dcbe3f93f548a3a1e0" default)))
 '(package-selected-packages
   (quote
    (auto-compile go-errcheck slime hydandata-light-theme eziam-theme atom-one-light-theme yasnippets elfeed-org org-bullets evil-org flycheck flyspell-correct-popup markdown-mode auto-dictionary auto-dictionary-mode magit dired-x evil-leader linum-relative evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; auto-compile: Automatically compile Emacs Lisp libraries
;;; https://github.com/emacscollective/auto-compile
(use-package auto-compile
  :ensure t
  :config
  (progn
    (auto-compile-on-load-mode)
    (auto-compile-on-save-mode)))

;; require custom packages
(require 'my-evil)
(require 'my-dired-x)
(require 'my-ibuffer)
(require 'my-lookfeel)
(require 'my-magit)
(require 'my-spellchecking)
(require 'my-flycheck)
(require 'my-org)
(require 'my-elfeed)
(require 'my-autocomplete)

;; Language Support
(require 'my-markdown)
(require 'my-golang)
(require 'my-lisp)

(provide 'init)
