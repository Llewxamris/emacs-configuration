;;;; init.el
;;; Defines mostly just the package management portions of Emacs. Ensures
;;; that ~use-package~ is available by default and kicks off to the other
;;; local configuration packages to get everything working.
(org-babel-load-file (concat user-emacs-directory "config.org"))

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

;;; Auto-generated Custom stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode nil)
 '(custom-safe-themes
	 (quote
		("82358261c32ebedfee2ca0f87299f74008a2e5ba5c502bde7aaa15db20ee3731" "9fcac3986e3550baac55dc6175195a4c7537e8aa082043dcbe3f93f548a3a1e0" default)))
 '(global-hl-line-mode t)
 '(global-visual-line-mode t)
 '(package-selected-packages
	 (quote
		(doom-modeline htmlize auctex auto-package-update which-key wakatime-mode go-eldoc go-mode yasnippet-snippets yasnippet company-box lsp-java telephone-line dockerfile-mode typescript-mode company-lsp lsp-ui lsp-mode nord-theme smooth-scrolling general elisp-slime-nav elips-slime-nav evil-commentary evil-cleverparens auto-compile go-errcheck slime hydandata-light-theme eziam-theme atom-one-light-theme yasnippets elfeed-org org-bullets evil-org flycheck flyspell-correct-popup markdown-mode auto-dictionary auto-dictionary-mode magit dired-x evil-leader linum-relative evil)))
 '(show-paren-mode t)
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Define configuration files for other packages and their configuration. All
;;; of these packages are local configs. I won't go into detail of what each
;;; package does here. Instead, check each individual file for it's purpose.

;; General packages
;; (require 'my-evil)
(require 'my-dired-x)
(require 'my-ibuffer)
(require 'my-magit)
(require 'my-spellchecking)
(require 'my-code-completion)
;; (require 'my-org)
(require 'my-elfeed)
(require 'my-autocomplete)

;; Language specific packages
(require 'my-docker)
(require 'my-markdown)
(require 'my-golang)
(require 'my-elisp)
(require 'my-typescript)

(provide 'init)
