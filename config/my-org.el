;;;; my-org.el
;;;; Package setup for org-mode
;;; org: Your life in plain text
;;; https://orgmode.org/
(use-package org
  :ensure org
  :commands (org-mode org-capture org-agenda orgtbl-mode)
  :init
  (progn
    ;; Auto-enter org-mode on files matching *.org
    (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
    ;; Set the org-agenda to read from the follow directory
    (setq org-agenda-files (list "~/doc/org/agenda"))
    (setq org-directory "~/doc/org")
    ;; Add a timestamp whenever a task is set to done
    (setq org-log-done 'time)
    ;; Use `inbox.org` when capturing
    (setq org-default-notes-file (concat org-directory "/inbox.org"))
    ;; Activiate the following org-modules
    (setq org-modules '(org-habit))
    ;; Set keywords and quick access keys
    (setq org-todo-keywords
	  ;; Generic task sequence, including appointment keyword
	  (quote ((sequence "TODO(t)" "STARTED(s)" "APPOINTMENT(a)" "|" "DONE(d)")
		  ;; Sequence for blocked tasks
		  (sequence "RAW WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")
		  ;; Sequence for financial tasks
		  (sequence "EXPENSE(e)" "OVERDUE(o@/!)" "|" "PAID(p)"))))
    ;; Enable fast todo selection
    (setq org-use-fast-todo-selection t)
    ;; Define org-capture templates
    ;; %? - Starting cursor position
    ;; %U - Insert an inactive timestamp
    (setq org-capture-templates
	  (quote (("t" "Task" entry (file "~/doc/org/agenda/inbox.org")
		   "* TODO %^{task-name}
:PROPERTIES:
:EFFORT: %^{effort|0.5|1|2|3|5|8|13}
:END:
SCHEDULED: %^{scheduled}T
DEADLINE: %^{deadline}T
%?")
		  ("T" "Raw task" entry (file "~/doc/org/agenda/inbox.org")
		   "* RAW %^{task-name}
%U
%?")
		  ("e" "Event" entry (file+headline "~/doc/org/agenda/todo.org" "Calendar")
		   "* %^{event-name}
%^{event-datetime}T
%?")
		  ("a" "Appointment" entry (file+headline "~/doc/org/agenda/todo.org" "Calendar")
		   "* APPOINTMENT %^{appointment-name}
SCHEDULED: %^{start-datetime}T
DEADLINE: %^{end-datetime}T
%?")
		  ("n" "Note" entry (file "~/doc/org/agenda/inbox.org")
		   "* %^{note-title}\n%?\n%U"))))))

;;; evil-org: Supplemental evil-mode keybindings to emacs org-mode
;;; https://github.com/Somelauw/evil-org-mode
(use-package evil-org
  :ensure t
  :after org
  :config
  (progn
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)))

;;; org-bullets: utf-8 bullets for org-mode
;;; https://github.com/sabof/org-bullets
(use-package org-bullets
  :ensure org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(provide 'my-org)
