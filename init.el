;;;; init.el
;;; Defines mostly just the package management portions of Emacs. Ensures
;;; that ~use-package~ is available by default and kicks off to the other
;;; local configuration packages to get everything working.

;; Setup the package package
(require 'package)

;; Always prefer the newer version of a package.
(setq load-prefer-newer t)

;; Initialize the packages.
(package-initialize)

;; Do not activate installed packages on startup.
(setq package-enable-at-startup nil)

;; Define the list of directories to search for local packages/configuration.
(eval-and-compile
	(defvar package-dir (expand-file-name "packages" user-emacs-directory)
		"The packages directory")
	(defvar config-dir (expand-file-name "config" user-emacs-directory)
		"The core configuration directory")
	(defvar language-config-dir (expand-file-name "languages" config-dir)
		"The language specific configuration directory")
	(add-to-list 'load-path config-dir)
	(add-to-list 'load-path language-config-dir)
	(add-to-list 'load-path package-dir))

;; Define which archives to use for fetching packages remotely.
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
													 ("org" . "http://orgmode.org/elpa/")
													 ("gnu" . "http://elpa.gnu.org/packages/")))

;; Auto-download use-package if it isn't already installed.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package. use-package is used for just about all of the package
;; management in this configuration.
(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Automatically update packages as new version come out
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

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
		(telephone-line powerline dockerfile-mode typescript-mode company-lsp lsp-ui lsp-mode nord-theme smooth-scrolling general elisp-slime-nav elips-slime-nav evil-commentary evil-cleverparens auto-compile go-errcheck slime hydandata-light-theme eziam-theme atom-one-light-theme yasnippets elfeed-org org-bullets evil-org flycheck flyspell-correct-popup markdown-mode auto-dictionary auto-dictionary-mode magit dired-x evil-leader linum-relative evil))))
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
		;; Auto-compile on both loading and saving.
		(auto-compile-on-load-mode)
		(auto-compile-on-save-mode)))

;;; Define configuration files for other packages and their configuration. All
;;; of these packages are local configs. I won't go into detail of what each
;;; package does here. Instead, check each individual file for it's purpose.
;; General packages
(require 'my-evil)
(require 'my-dired-x)
(require 'my-ibuffer)
(require 'my-lookfeel)
(require 'my-magit)
(require 'my-spellchecking)
(require 'my-code-completion)
(require 'my-org)
(require 'my-elfeed)
(require 'my-autocomplete)

;; Language specific packages
(require 'my-docker)
(require 'my-markdown)
(require 'my-golang)
; (require 'my-lisp)
(require 'my-elisp)
(require 'my-typescript)

(provide 'init)
