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
	  '((sequence "TODO(t)" "STARTED(s)" "APPOINTMENT(a)" "|" "DONE(d)")
		  ;; Sequence for blocked tasks
		  (sequence "RAW(-)" "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")
		  ;; Sequence for financial tasks
		  (sequence "EXPENSE(e)" "OVERDUE(o@/!)" "|" "PAID(p)")))
    ;; Enable fast todo selection
    (setq org-use-fast-todo-selection t)
    ;; Define my org-capture templates. All templates are defined inside
    ;; external *.txt files to keep this configuration file clean.
    ;; The goal of each template is to capture down the minimum amount of
    ;; data required for the item to be actionable (except for RAW).
    (setq org-capture-templates
	  '(
	    ;; 1. Task captures an actionable todo item. This means providing
	    ;;    a proper name, the estimated effort of the todo item,
	    ;;    and a schedule date and/or deadline date. Tasks should
	    ;;    also have at least one context tag. Priorities should be
	    ;;    set later after grooming through tasks.
	    ;;
	    ;;    Proper tasks are still put into the inbox, as I do not want
	    ;;    to fill up my todo list with tasks that I know do not need
	    ;;    to be completed today.
	    ("t" "Task" entry (file "~/doc/org/agenda/inbox.org")
	     (file "~/.emacs.d/capture-templates/task.txt"))
	    ;; 2. Raw task captures a raw task, idea, or note, that required
	    ;;    refinement before moving out of the inbox. This could be
	    ;;    anything from a quote I read/heard that needed quick
	    ;;    capturing, to a project idea, to a meeting I want to have in
	    ;;    the future. Raw tasks are to never leave the inbox.
	    ("T" "Raw task" entry (file "~/doc/org/agenda/inbox.org")
	     (file "~/.emacs.d/capture-templates/raw-task.txt"))
	    ;; 3. Event captures dates for events that are not appointments.
	    ;;    For example: birthdays, outtings, holidays, etc.
	    ;;
	    ;;    Events have a name, at least one context tag, and the
	    ;;    datetime of the event.
	    ("e" "Event" entry (file+headline "~/doc/org/agenda/todo.org" "Calendar")
	     (file "~/.emacs.d/capture-templates/event.txt"))
	    ;; 4. Appointment captures appointments from both work and home.
	    ;;    An appointment is a timeboxed professional session where
	    ;;    I must be in a given location from the scheduled time to
	    ;;    the deadline. This could be used for meetings at work,
	    ;;    going to the mechanics, going to the doctors, meeting
	    ;;    for lunch, etc.
	    ;;
	    ;;   Appointments have a name, their scheduled (start) and
	    ;;   deadline (end) datetime, and by default have the @appointment
	    ;;   tag. An additional tag is prompted for.
	    ("a" "Appointment" entry (file+headline "~/doc/org/agenda/todo.org" "Calendar")
	     (file "~/.emacs.d/capture-templates/appointment.txt"))
	    ;; 5. Note captures a basic note. This note has a name, a
	    ;;    timestamp, and then the content.
	    ("n" "Note" entry (file "~/doc/org/agenda/inbox.org")
	     (file "~/.emacs.d/capture-templates/note.txt"))
	    ;; 6. Chore captures a new chore. A chore is any sort of dull
	    ;;    maintenance work that has to be done manually, usually
	    ;;    cleaning.
	    ;;
	    ;;    Chores have a name, a context tag (@chores is inherited),
	    ;;    a tag showing how often the chore should be repeated, and
	    ;;    the scheduled datetime. This datetime should repeat
	    ;;    according to the tag.
	    ("C" "Chore" entry (file+headline "~/doc/org/agenda/todo.org" "Chores")
	     (file "~/.emacs.d/capture-templates/chore.txt"))))

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
			  ("@relationship" . ?r)))

		;; By default, show today and the next two days when opening the agenda.
		;; When planning ahead, three days is usually good enough to see if I'm
		;; overworking myself.
		(setq org-agenda-span 3)

		;; Pushes off the tags if I'm viewing the agenda in a verticle split on the
		;; laptop. I'd rather see the content of the heading rather than the tags
		;; associated in most contexts.
		(setq org-agenda-tags-column -100)

		;; Shows the content of the log in the agenda view. Mostly, this is used
		;; to see when I clocked into a task.
		(setq org-agenda-show-log t)

		;; Do not show scheduled/deadlined tasks if the task is in a done state.
		;; Prevents cluttering with completed tasks,
		(setq org-agenda-skip-scheduled-if-done t)
		(setq org-agenda-skip-deadline-if-done t)

		;; Do show the post-scheduled counter if the deadline counter is current
		;; visible in the agenda.
		(setq org-agenda-skip-scheduled-if-deadline-is-shown t)

		;; Set the how the org-agenda is displayed (currently, just using the
		;; default setting.
		(setq org-agenda-time-grid
					'((daily today require-timed)
						(800 1000 1200 1400 1600 1800 2000)
						"......" "----------------"))))

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
