;;;; my-groovy.el
;;;; Package setup for the Groovy programming language
;;; groovy-mode - A groovy major mode, grails minor mode, and a groovy inferior mode.
;;; https://github.com/Groovy-Emacs-Modes/groovy-emacs-modes
(use-package groovy-mode
  :ensure t
  ;; Use groovy-mode on Groovy and Gradle files
  :mode (("*.groovy" . groovy-mode)
	 ("*.gradle" . groovy-mode)))

(provide 'my-groovy)
