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
(use-package base16-theme
:straight t
:config (load-theme 'base16-chalk t)
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
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
(dashboard-setup-startup-hook))
(use-package aggressive-indent
:straight t
:hook (prog-mode . aggressive-indent-mode)
)
(show-paren-mode 1)
(add-hook 'prog-mode-hook (lambda () (setq display-line-numbers 'relative)))
(electric-pair-mode)
(use-package paredit
:straight t
:hook (lisp-mode . paredit-mode))
(use-package rainbow-delimiters
:straight t
:hook (lisp-mode . rainbow-delimiters-mode))
(use-package move-text
:straight t
:bind (("M-p" . move-text-up)
("M-n" . move-text-down)))
(use-package yasnippet
:straight t
:config (yas-global-mode 1))
(setq next-line-add-newlines t)
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
:config (vertico-mode 1))
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
:init
(marginalia-mode))
(use-package diff-hl
:straight t
:hook (prog-mode . diff-hl-mode))
(use-package which-key
:straight t
:config
(setq which-key-idle-delay 0.5)
(which-key-mode))
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-capture-templates
'(("t" "Todo" entry (file+headline "~/org/inbox.org" "Tasks")
"* TODO %?\nSCHEDULED: %t\n%i")
("n" "Note" entry (file+headline "~/org/notes.org" "Notes"))))
(global-set-key (kbd "C-c c") 'org-capture)
(use-package org-noter
:straight t)
(use-package org-journal
:straight t
:ensure t
:defer t
:config
(setq org-journal-dir "~/org/journal"))
(use-package org-roam
:ensure t
:straight t
:init
(setq org-roam-v2-ack t)
:custom
(org-roam-directory (file-truename "~/org/roam"))
:config
(org-roam-db-autosync-mode)
(require 'org-roam-protocol)
:bind (("C-c r f" . org-roam-node-find)
("C-c r i" . org-roam-node-insert)
("C-c r u" . org-roam-ui-open)
("C-c r b" . org-roam-buffer-toggle)))
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
(use-package org-superstar
:straight t
:hook (org-mode . org-superstar-mode))
(setq org-adapt-indentation 't)
(use-package company
:straight t
:hook ((prog-mode . company-mode)
(eshell-mode . company-mode))
:config (setq company-idle-delay 0))
(use-package go-mode
:straight t
:mode "\\.go\\'")
(use-package haskell-mode
:straight t
:mode "\\.hs\\'")
(use-package nim-mode
:straight t
:mode "\\.nim\\'")
(use-package python
:straight t
:mode ("\\.py\\'" . python-mode))
(use-package rust-mode
:straight t
:mode "\\.rs\\'")
(use-package clojure-mode
:straight t
:mode "\\.clj\\'")
(use-package cider
:straight t)
(use-package sly
:straight t
:init
(setq inferior-lisp-program "/bin/sbcl"))
(use-package lsp-mode
:straight t
:hook ((go-mode . lsp)
(rust-mode . lsp)
(nim-mode . lsp))
:commands lsp)
