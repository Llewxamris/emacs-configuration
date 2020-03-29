;;; -*- lexical-binding: t -*-

;;; Commentary:
;; This init file bootstraps my Emacs configuration by tangling the /actual/
;; configuration file "conifg.org", then loading the resulting Emacs Lisp code.
;;
;; If "early-init.el" is not found when Emacs starts (e.g. this is the first
;; time I ran Emacs on a machine) then it is loaded before the main
;; configuration. This way, no configuration is lost.

;;; Code:
(require 'org)

(let* ((early-init-file
        (expand-file-name "early-init.el" user-emacs-directory))
       (older-early-init-file-exists-p
        (file-exists-p early-init-file)))
  (org-babel-tangle-file (expand-file-name "config.org" user-emacs-directory))
  (unless older-early-init-file-exists-p
    (load-file early-init-file))
  (load-file (expand-file-name "config.el" user-emacs-directory)))

(provide 'init)
;;; init.el ends here
