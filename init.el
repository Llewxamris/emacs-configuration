;;;; init.el
;;; Setup package managment
;; Setup the package package
(require 'package)
(setq load-prefer-newer t)
(package-initialize)
(setq package-enable-at-startup nil)

;; Define the list of directories to search for files to load
(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))
(add-to-list 'load-path (concat user-emacs-directory "packages"))

;; Define which archives to use for packages
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))

;; Auto-download use-package if it isn't already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-pacakge
(require 'use-package)

;;; Auto-generated Custom stuff
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
    (elisp-slime-nav elips-slime-nav evil-commentary evil-cleverparens auto-compile go-errcheck slime hydandata-light-theme eziam-theme atom-one-light-theme yasnippets elfeed-org org-bullets evil-org flycheck flyspell-correct-popup markdown-mode auto-dictionary auto-dictionary-mode magit dired-x evil-leader linum-relative evil))))
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

;;; Define configuration files for other packages and their configuration
;; General packages
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

;; Language specific packages
(require 'my-markdown)
(require 'my-golang)
(require 'my-lisp)
(require 'my-elisp)

(provide 'init)
