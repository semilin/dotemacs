(defvar bootstrap-version)
(let ((bootstrap-file
(expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
(bootstrap-version 5))
(unless (file-exists-p bootstrap-file)
(with-current-buffer
(url-retrieve-synchronously
"https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
'silent 'inhibit-cookies)
(goto-char (point-max))
(eval-print-last-sexp)))
(load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)
(setenv "PATH"
(concat
"/home/semi/go/bin" ":"
"/home/semi/.nimble/bin" ":"
(getenv "PATH")
)
)
(setq backup-directory-alist '(("." . "~/.config/emacs/saves/")))
(defun reload-config ()
(interactive)
(load-file "~/.config/emacs/init.el"))
(use-package dracula-theme
:straight t
:config (load-theme 'dracula t)
)
(use-package fira-code-mode
:straight t
:defer t
:hook (prog-mode . fira-code-mode))
(use-package telephone-line
:straight t
:hook (after-init . telephone-line-mode))
(use-package all-the-icons
:straight t)
(use-package dashboard
:straight t
:config
(setq dashboard-banner-logo-title "Semimacs")
(setq dashboard-center-content t)
(setq dashboard-startup-banner 'logo)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(dashboard-setup-startup-hook))
(use-package aggressive-indent
:straight t
:hook (prog-mode . aggressive-indent-mode)
)
(show-paren-mode 1)
(add-hook 'prog-mode-hook (lambda () (setq display-line-numbers 'relative)))
(use-package undo-fu
:straight t
:bind (("C-/" . undo-fu-only-undo)
("M-/" . undo-fu-only-redo)))
(electric-pair-mode)
(use-package paredit
:straight t
:hook (lisp-mode . paredit-mode))
(use-package rainbow-delimiters
:straight t
:hook (lisp-mode . rainbow-delimiters-mode))
(use-package god-mode
:straight t
:config
(god-mode)
(global-set-key (kbd "C-x C-1") #'delete-other-windows)
(global-set-key (kbd "C-x C-2") #'split-window-below)
(global-set-key (kbd "C-x C-3") #'split-window-right)
(global-set-key (kbd "C-x C-0") #'delete-window)
(global-set-key (kbd "C-x C-o") #'other-window)
(defun my-god-mode-update-cursor-type ()
(setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))
(add-hook 'post-command-hook #'my-god-mode-update-cursor-type)
:bind (("<escape>" . god-local-mode)))
(use-package move-text
:straight t
:bind (("M-p" . move-text-up)
("M-n" . move-text-down)))
(use-package yasnippet
:straight t
:config (yas-global-mode 1))
(setq next-line-add-newlines t)
(use-package popup
:straight t)
(use-package langtool
:straight t
:config
(setq langtool-language-tool-jar "/home/semi/dl/LanguageTool-5.7-stable/languagetool-commandline.jar")
(defun langtool-autoshow-detail-popup (overlays)
(unless (or popup-instances
(memq last-command '(keyboard-quit)))
(let ((msg (langtool-details-error-message overlays)))
(popup-tip msg))))
(setq langtool-autoshow-message-function
'langtool-autoshow-detail-popup))
(use-package circe
:straight t
:config
(setq circe-network-options
'(("Libera Chat"
:tls t
:nick "semi"
:sasl-username "semi"
:sasl-password "4L6&hU+DHgD|M3)(QGL7\\pbE\\>:@;(GD"
:channels ("#emacs"
"#commonlisp")))))
(use-package consult
:straight t
:bind (("C-x b" . consult-buffer)
("C-x p b" . consult-project-buffer)
("C-x i" . consult-imenu)
("C-x p i" . consult-imenu-multi)))
(use-package emms
:straight t
:config
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/music/"))
(add-hook 'eshell-mode-hook '(lambda ()
(define-key eshell-mode-map (kbd "<tab>") 'completion-at-point)))
(use-package elfeed
:straight t)
(use-package elfeed-org
:straight t
:config
(elfeed-org)
(setq rmh-elfeed-org-files (list "~/.config/emacs/elfeed.org")))
(use-package vertico
:straight t
:config
(setq read-extended-command-predicate
#'command-completion-default-include-p)
(vertico-mode 1))
(use-package orderless
:straight t
:init
(setq completion-styles '(orderless)
completion-category-defaults nil
completion-category-overrides '((file (styles partial-completion)))))
(use-package savehist
:init
(savehist-mode))
(use-package notmuch
:straight t)
(use-package magit
:straight t
:defer t
:bind ("C-x g" . magit-status))
(use-package marginalia
:straight t
:init (marginalia-mode))
(use-package diff-hl
:straight t
:hook (prog-mode . diff-hl-mode))
(use-package which-key
:straight t
:config
(setq which-key-idle-delay 0.5)
(which-key-mode))
(use-package org
:straight t)
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-capture-templates
'(("t" "Inbox" entry (file+headline "~/org/capture/inbox.org" "Inbox")
"* TODO %?\nSCHEDULED: %t\n%i")
("s" "Schedule" entry (file+headline "~/org/capture/inbox.org" "Inbox")
("* %?\nSCHEDULED: %t\n%i"))))
(global-set-key (kbd "C-c c") 'org-capture)
(use-package org-noter
:straight t)
(use-package org-journal
:straight t
:ensure t
:defer t
:config
(setq org-journal-dir "~/org/journal"))
(setq org-refile-targets (quote (("school.org" :maxlevel . 2)
("personal_projects.org" :maxlevel . 2)
("someday.org" :maxlevel . 2))))
(use-package org-roam
:ensure t
:straight t
:init
(setq org-roam-v2-ack t)
:custom
(org-roam-directory (file-truename "~/org/roam"))
:config
(setq org-roam-capture-templates
'(("m" "main" plain
"%?"
:if-new (file+head "main/${slug}.org"
"#+title: ${title}\n")
:immediate-finish t
:unnarrowed t)))
(org-roam-db-autosync-mode)
(require 'org-roam-protocol)
:bind (("C-c r f" . org-roam-node-find)
("C-c r i" . org-roam-node-insert)
("C-c r c" . org-roam-capture)
("C-c r u" . org-roam-ui-open)
("C-c r b" . org-roam-buffer-toggle)
("C-c r d c" . org-roam-dailies-capture-today)
("C-c r d t" . org-roam-dailies-goto-today)
("C-c r d d" . org-roam-dailies-goto-date)))
(use-package org-roam-ui
:straight
(:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
:after org-roam
:config
(setq org-roam-ui-sync-theme t
org-roam-ui-follow t
org-roam-ui-update-on-save t
org-roam-ui-open-on-start t))
(use-package org-recur
:demand t
:straight t
:hook ((org-mode . org-recur-mode)
(org-agenda-mode . org-recur-agenda-mode))
:config
(define-key org-recur-mode-map (kbd "C-c d") 'org-recur-finish)
(define-key org-recur-agenda-mode-map (kbd "d") 'org-recur-finish)
(define-key org-recur-agenda-mode-map (kbd "C-c d") 'org-recur-finish)
(setq org-recur-finish-done t
org-recur-finish-archive t))
(use-package org-present
:straight t
:hook
((org-present-mode . (lambda ()
(org-present-big)
(org-display-inline-images)
(org-present-hide-cursor)
(org-present-read-only)))
(org-present-mode-quit . (lambda ()
(org-present-small)
(org-remove-inline-images)
(org-present-show-cursor)
(org-present-read-write)))))
(use-package org-super-agenda
:straight t
:config
(org-super-agenda-mode)
(setq org-super-agenda-groups
'((:auto-group t))))
(use-package org-superstar
:straight t
:hook (org-mode . org-superstar-mode))
(add-hook 'org-mode-hook 'auto-fill-mode)
(setq org-adapt-indentation 't)
(use-package company
:straight t
:hook ((prog-mode . company-mode)
(eshell-mode . company-mode))
:config (setq company-idle-delay 0))
(use-package ccls
:straight t
:config
(setq ccls-executable "/bin/ccls")
)
(use-package clojure-mode
:straight t
:defer t
:mode "\\.clj\\'")
(use-package cider
:straight t)
(use-package sly
:straight t
:init
(setq inferior-lisp-program "/bin/sbcl"))
(use-package go-mode
:straight t
:defer t
:mode "\\.go\\'")
(use-package haskell-mode
:straight t
:defer t
:mode "\\.hs\\'")
(use-package janet-mode
:straight t
:defer t
:mode "\\.janet\\'")
(use-package julia-mode
:straight t
:defer t
:mode "\\.jl\\'")
(use-package nim-mode
:straight t
:defer t
:mode "\\.nim\\'")
(define-generic-mode
'odin-mode
'("//") ; comment
'("package" "import" "proc")
'(("=" . 'font-lock-operator))
'(".odin\\'")
nil)
(defun odin-compile ()
(interactive)
(shell-command "/home/semi/dl/build/Odin/odin build ."))
(defun odin-run ()
(interactive)
(shell-command "/home/semi/dl/build/Odin/odin run ."))
(defvar odin-mode-map (make-keymap))
(define-key odin-mode-map (kbd "C-c C-c") 'odin-compile)
(define-key odin-mode-map (kbd "C-c C-r") 'odin-run)
(use-package python
:straight t
:defer t
:mode ("\\.py\\'" . python-mode))
(use-package rust-mode
:ensure
:straight t
:config
:defer t
:mode ("\\.rs\\'" . rust-mode))
(use-package zig-mode
:straight t
:defer t
:mode "\\.zig\\'")
(use-package eglot
:ensure
:straight t)
