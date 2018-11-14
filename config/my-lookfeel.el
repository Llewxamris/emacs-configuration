;;;; my-lookfeel.el
;;;; Package setup for visuals and general settings
;;; linum-relative: Vim-like relative line numbers
;;; https://github.com/coldnew/linum-relative
(use-package linum-relative
  :ensure linum-relative
  :init
  ;; Always use relative line numbers
  (linum-relative-global-mode 1))

;;; hydandata-light-theme - Light color theme that is easy on your eyes
;;; https://github.com/hydandata/hydandata-light-theme
(use-package hydandata-light-theme
  :ensure t
  :config
  (progn
    ;; Load the theme unless running inside a terminal session
    (unless noninteractive
      (load-theme 'hydandata-light t))))

;;; General settings
;; Disable the intro screen & message
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; Sane line wrapping
(visual-line-mode 1)

;; Always trail newline
(setq require-final-newline t)

;; Disable the toolbar
(tool-bar-mode -1)

;; Set font
(add-to-list 'default-frame-alist '(font . "Hack-10"))

(provide 'my-lookfeel)
