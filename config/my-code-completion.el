;;;; my-code-completion.el
;;;; Package setup for code completion and linting
;;; flycheck - On the fly syntax checking for GNU Emacs
;;; https://github.com/flycheck/flycheck
(use-package flycheck
  :ensure t
  ;; Flycheck by default
  :init (global-flycheck-mode)
  :config
  ;; Disable flycheck on checkdoc
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;;; company-mode - Modular in-buffer completion framework for Emacs
;;; http://company-mode.github.io/
(use-package company
	:ensure t
	;; Run company-mode globally for the entire session
	:hook ('after-init-hook . 'global-company-mode))

;;; lsp-mode - Emacs client/library for the Language Server Protocol
;;; https://github.com/emacs-lsp/lsp-mode
(use-package lsp-mode
	:ensure t
	:config
	(progn
		;; Attempt to find a language server for any programming language mode
		(add-hook 'prog-mode-hook  #'lsp)

		;; Bindings for my most used lsp-mode commands
		(general-define-key
		 :states 'normal
		 :prefix "SPC c"
		 ;; Format all source code within the active buffer
		 "f" 'lsp-format-buffer
		 ;; Organize imports in the active buffer
		 "o" 'lsp-organize-imports
		 ;; Rename a symbol accross an entire project
		 "r" 'lsp-rename)))
		
;;; lsp-ui
;;; Higher level UI modules of lsp-mode, like flycheck support and code lenses
(use-package lsp-ui
	:ensure t
	:config
	(progn
		;; Disable sideline information and floating doc window. Neither works
		;; in a way that I think is useful. The Doc window is close, but small bugs
		;; within it makes it an eyesore more often than not.
		(setq lsp-ui-sideline-enable nil)
		(setq lsp-ui-doc-enable nil)

		(defun toggle-lsp-ui-doc ()
			"Toggle the UI Doc"
			(interactive)
			(if (lsp-ui-doc--visible-p)
					(lsp-ui-doc-hide)
				(lsp-ui-doc-show)))

		(defun toggle-lsp-ui-imenu ()
			"Toggle the ~lsp-ui~ ~imenu~ buffer."
			(interactive)
			(if (get-buffer "*lsp-ui-imenu*")
					(kill-buffer "*lsp-ui-imenu*")
				(lsp-ui-imenu)))

		;; Bindings for the "Peek" functionality
		(general-define-key
		 :states 'normal
		 :prefix "SPC p"
		 "d" 'lsp-ui-peek-find-definitions
		 "r" 'lsp-ui-peek-find-references)

		;; Bindings to view ~lsp-ui~ content
		(general-define-key
		 :states 'normal
		 :prefix "SPC s"
		 ;; Shows the Doc window if the Doc window is not already visible
		 "d" 'toggle-lsp-ui-doc
		 ;; Create the ~imenu~ buffer is not already available. Kills the buffer
		 ;; if it is.
		 "m" 'toggle-lsp-ui-imenu)))

;;; company-lsp - Company completion backend for lsp-mode
;;; https://github.com/tigersoldier/company-lsp
(use-package company-lsp
	:ensure t
	:config
	(progn
		;; Add company-lsp as a backend to company-mode
		(push 'company-lsp company-backends)

		;; Cache completions if the cached results are incomplete
		(setq company-lsp-cache-candidates 'auto)

		;; Fetch completion results asynchronously. No need to lock up just to
		;; fetch results from the language server.
		(setq company-lsp-async t)

		;; Enable snippet expansion from the language sever.
		(setq company-lsp-enable-snippet t)

		;; Allow recompletion in the case there are other completion trigger
		;; characters.
		(setq company-lsp-enable-recompletion t)))

(provide 'my-code-completion)
