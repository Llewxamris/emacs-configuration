;;;; my-spellchecking.el
;;;; Package setup for spell checking
;;; flyspell - On-the-fly spell checking in Emacs
;;; http://www-sop.inria.fr/members/Manuel.Serrano/flyspell/flyspell.html
;;; This package is installed manually
(use-package flyspell
  :ensure flyspell
  :config
  ;; Enable flyspell inside org-mode and markdown-mode
  (add-hook 'markdown-mode-hook 'flyspell-mode)
  (add-hook 'org-mode-hook 'flyspell-mode))

;;; popop - Visual Popup Interface Library for Emacs
;;; https://github.com/auto-complete/popup-el
(use-package popup
	:ensure popup
	:config
	;; Navigate through any popup menu using [jk]
	(progn
		(general-define-key
		 :keymaps 'popup-menu-keymap
		 "j" 'popup-next
		 "k" 'popup-previous)))

;;; flyspell-correct-popup - Correcting words with flyspell via custom interface.
;;; https://github.com/d12frosted/flyspell-correct
(use-package flyspell-correct-popup
  :ensure flyspell-correct-popup)

;;; auto-dictionaryEmacs: Automatic dictionary switcher for flyspell 
;;; https://github.com/nschum/auto-dictionary-mode
(use-package auto-dictionary
  :ensure auto-dictionary
  :config
  (add-hook 'flyspell-mode-hook 'auto-dictionary-mode))

(provide 'my-spellchecking)
