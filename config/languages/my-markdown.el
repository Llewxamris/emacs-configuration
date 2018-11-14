;;;; my-markdown.el
;;;; Package setup for the Markdown language
;;; markdown-mode - Emacs Markdown Mode
;;; https://github.com/jrblevin/markdown-mode
(use-package markdown-mode
  :ensure markdown-mode
  :commands (markdown-mode gfm-mode)
  ;; Use GitHub markdown on README.md files, and regular Markdown on others
  :mode (("README\\.md'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)))

(provide 'my-markdown)
