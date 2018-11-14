;;;; my-magit.el
;;;; Package setup for Magit
;;; magit - It's Magit! A Git porcelain inside Emacs
;;; https://github.com/magit/magit
(use-package magit
  :ensure magit
  :config
  (progn
    ;; Use evil-mode inside Magit modes
    (evil-set-initial-state 'magit-mode 'normal)
    (evil-set-initial-state 'magit-status-mode 'normal)
    (evil-set-initial-state 'magit-diff-mode 'normal)
    (evil-set-initial-state 'magit-log-mode 'normal)
    ;; Navigate through magit modes using [jk]
    (evil-define-key 'normal magit-mode-map
        "j" 'magit-section-forward
        "k" 'magit-section-backward)
    (evil-define-key 'normal magit-log-mode-map
        "j" 'magit-section-forward
        "k" 'magit-section-backward)
    (evil-define-key 'normal magit-diff-mode-map
        "j" 'magit-section-forward
        "k" 'magit-section-backward)))

(provide 'my-magit)
