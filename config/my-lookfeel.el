;;;; my-lookfeel.el
;;;; Package setup for visuals and general settings
;;; linum-relative: Vim-like relative line numbers
;;; https://github.com/coldnew/linum-relative
(use-package linum-relative
  :ensure linum-relative
  :init
  ;; Always use relative line numbers
	(setq linum-relative-backend 'display-line-numbers-mode)
  (linum-relative-global-mode 1))
;;; hydandata-light-theme - Light color theme that is easy on your eyes
;;; https://github.com/hydandata/hydandata-light-theme
(use-package nord-theme
  :ensure t
  :config
  (progn
    ;; Load the theme unless running inside a terminal session
    (unless noninteractive
      (load-theme 'nord t))))

;;; smooth-scrolling - Emacs smooth scrolling package
;;; https://github.com/aspiers/smooth-scrolling
(use-package smooth-scrolling
  :ensure t
  :init
  (smooth-scrolling-mode 1))

;;; telephone-line - A new implementation of Powerline for Emacs
;;; https://github.com/dbordak/telephone-line
(use-package telephone-line
	:ensure t
	:init
	(progn
		(telephone-line-mode 1)))

;;; which-key - Emacs package that displays available keybindings in popup
;;; https://github.com/justbur/emacs-which-key
(use-package which-key
	:ensure t
	:init
	(progn
		(which-key-mode)))

;;; General settings
(progn
	;; Required for revert settings in Dired
	(require 'autorevert)

  ;; Disable the intro screen & message
  (setq inhibit-splash-screen t
	inhibit-startup-echo-area-message t
	inhibit-startup-message t)

  ;; Automatically refresh buffers. That is: If the content of a buffer
  ;; changes (such as a file changing on disk), then redraw the buffer
  ;; (such as loading the new changes from the disk).
  (global-auto-revert-mode t)

  ;; Same as above, but specifically auto-refreshes Dired. This prevents
  ;; a Dired buffer from being out of sync with the actual filesystem.
  (setq global-auto-revert-non-file-buffers t)

  ;; Prevents getting a nag whenever the auto-revert triggers. I don't
  ;; need to know if a Dired buffer has reverted.
  (setq auto-revert-verbose nil)

  ;; Show the keystrokes after 0.1 seconds. I want to see the current
  ;; keystrokes as soon as possible.
  (setq echo-keystrokes 0.1)

  ;; Automatically decompress files when reading, and then compress
  ;; again when writting.
  (auto-compression-mode t)

  ;; Force syntax highlighting for all supported major modes. I have no
  ;; reason to not be using syntax highlighting.
  (global-font-lock-mode t)

  ;; Change the "Yes or No" prompt to just be "y or n". No need to bog
  ;; down making choices.
  (defalias 'yes-or-no-p 'y-or-n-p)

  ;; Use UTF-8 encoding everywhere. I rarely run Emacs in a terminal,
  ;; and even then my terminal of choice also supports UTF-8. No
  ;; reason to not enable.
  (setq locale-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)

  ;; Always show the current line number and column number
  ;; in the buffer. When both enabled, they appear like this:
  ;;
  ;; (line, col)
  (setq line-number-mode t)
  (setq column-number-mode t)

  ;; Set automatic line-wrapping to begin at column 80.
  ;; A vertically split Emacs on my laptop shows up to 78 columns, so there's
  ;; no reason not to increase from the default.
  (setq fill-column 80)
  (set-default 'fill-column 80)

  ;; Disable the vertical scrollbar. The modeline shows me my current location
  ;; in the file, and takes up precious columns on my laptop.
  (scroll-bar-mode -1)

  ;; Use spaces instead of tabs.
  ;; There must be a better way of doing this, but I sure can't find it
  (setq-default tab-width 2)
  (setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
  (setq indent-tabs-mode nil)

  ;; Undo/Redo window layouts using C-c <left> and C-c <right>. Lets me fix
  ;; accidently destroying the layout of windows and buffers.
  (winner-mode 1)

  ;; Do not split lines into multiple lines if they overflow the window. This
  ;; can really break the display on some files.
  (setq-default truncate-lines t)

  ;; Sentances do not end with a double space. I don't think I've ever seen
  ;; someone do this irl.
  (set-default 'sentence-end-double-space nil)

  ;; Always leave a single trailing newline at the end of a file.
  (setq require-final-newline t)

  ;; Disable the toolbar.
  (tool-bar-mode -1)

  ;; Set the current font to "Go Mono" with a size of 10.
  (add-to-list 'default-frame-alist '(font . "GoMono-10")))

(provide 'my-lookfeel)
