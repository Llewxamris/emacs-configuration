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
		  (sequence "RAW(-) WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")
		  ;; Sequence for financial tasks
		  (sequence "EXPENSE(e)" "OVERDUE(o@/!)" "|" "PAID(p)"))))
    ;; Enable fast todo selection
    (setq org-use-fast-todo-selection t)
    ;; Define org-capture templates
    (setq org-capture-templates
	  (quote (("t" "Task" entry (file "~/doc/org/agenda/inbox.org")
		   (file "~/doc/org/agenda/capture-templates/task.txt"))
		  ("T" "Raw task" entry (file "~/doc/org/agenda/inbox.org")
		   (file "~/doc/org/agenda/capture-templates/raw-task.txt"))
		  ("e" "Event" entry (file+headline "~/doc/org/agenda/todo.org" "Calendar")
		   (file "~/doc/org/agenda/capture-templates/event.txt"))
		  ("a" "Appointment" entry (file+headline "~/doc/org/agenda/todo.org" "Calendar")
		   (file "~/doc/org/agenda/capture-templates/appointment.txt"))
		  ("n" "Note" entry (file "~/doc/org/agenda/inbox.org")
		   (file "~/doc/org/agenda/capture-templates/note.txt")))))
    ;; Provide refile targets as paths
    (setq org-refile-use-outline-path nil)
    ;; Allow refile to create parent nodes
    (setq org-refile-allow-creating-parent-nodes 'confirm)
    ;; Set refile target to be all the agenda files
    (setq org-refile-targets '((org-agenda-files . (:maxlevel . 3))))

    ;; Set custom faces for state keywords. The faces should represent
    ;; the emotion the keyword is reflecting, while matching the
    ;; theme of my setup. Nothing special is set for tasks like TODO,
    ;; STARTED, and DONE as I feel they work well out of the box.
    (setq org-todo-keyword-faces
	  '(
	    ;; 1. RAW is set to the org-warning face. RAW should never be used
	    ;;    outside of my inbox, as it represents an unfinished thought
	    ;;    or task.
	    ("RAW" . org-warning)
	    ;; 2. WAITING & HOLD are set to a bold orange colour. Both states
	    ;;    represent a task that is not actively being worked on by
	    ;;    myself, but has not been completed or cancelled. The colour
	    ;;    is an orange from the colour theme, that evokes pause while
	    ;;    still catching my eye and alerting me that the given task
	    ;;    still requires input. This could trigger sending out an
	    ;;    email to see progress, or evaluating the task and deciding
	    ;;    to cancel.
	    ("WAITING" . (:foreground "#ff7800" :weight bold ))
	    ("HOLD" . (:foreground "#ff7800" :weight bold ))
	    ;; 3. CANCELLED is set to the org-archived face to signify that
	    ;; the task no longer needs my attention. 
	    ("CANCELLED" . org-archived)
	    ;; 4. OVERDUE is set to a bold red to signify the danger of
	    ;;    unpaid expenses. I want to feel a wash of fear everytime
	    ;;    I see that bold red inside my todo list.
	    ("OVERDUE" . (:foreground "red" :background "lightgrey" :weight ultrabold :underline t))))
    
    
    ;; Exclude the follow tags from being inherited by children.
    ;; 1. Sub-tasks for a project do not need to be also tagged as a
    ;;    project, unless they too have several sub-tasks.
    (setq org-tags-exclude-from-inheritance '("project"))

    ;; Set tags for quick selections. Tags beginning with '@' are contexts.
    ;; Contexts define the "mindset" I associate with each task.
    ;;
    ;; This means that the contexts are not just physical locations, but
    ;; how I represent that location mental. For example, @chores is a mindset
    ;; I need to get in to do chores that I usually find dull. @chores can be
    ;; done @home, which combines the mindset I need for dull work with the
    ;; mindset of being inside the living space of myself and my family.
    ;;
    ;; Tags like "project" therefore are not contexts. A project is just a
    ;; way of organizing work by breaking large goals into smaller, more
    ;; manageable chunks. There is no mindset for doing a project, however
    ;; a @programming project requires to be in the mental state for
    ;; programming and problem solving.
    (setq org-tag-alist '(("@work" . ?w)
			  ("@home" . ?h)
			  ("@chores" . ?c)
			  ("@car" . ?C)
			  ("@programming" . ?p)
			  ("@finance" . ?f)
			  ("@family" . ?m)
			  ("@appointment" . ?a)
			  ("project" . ?j)
			  ("@relationship" . ?r)))))

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
