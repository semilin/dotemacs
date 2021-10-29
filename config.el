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
(setq auto-save-file-name-transforms
`((".*" "~/.config/emacs/saves/" t)))
(defun reload-config ()
(interactive)
(shell-command "quicktangle ~/.config/emacs/config.org ~/.config/emacs/config.el")
(load-file "~/.config/emacs/config.el"))
(use-package doom-themes
:straight t
:config (load-theme 'doom-dracula t)
)
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
(electric-pair-mode)
(use-package move-text
:straight t
:bind (("M-p" . move-text-up)
("M-n" . move-text-down)))
(use-package yasnippet
:straight t
:config (yas-global-mode 1))
(setq next-line-add-newlines t)
(use-package vertico
:straight t
:config (vertico-mode 1))
(use-package magit
:straight t
:defer t
:bind ("C-x g" . magit-status))
(use-package marginalia
:straight t
:init
(marginalia-mode))
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
(require 'org-roam-protocol))
(use-package org-roam-ui
:straight
(:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
:after org-roam
:config
(setq org-roam-ui-sync-theme t
org-roam-ui-follow t
org-roam-ui-update-on-save t
org-roam-ui-open-on-start t))
(use-package org-superstar
:straight t
:hook (org-mode . org-superstar-mode))
(setq org-adapt-indentation 't)
(use-package company
:straight t
:hook (prog-mode . company-mode)
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
(use-package lsp-mode
:straight t
:hook ((go-mode . lsp)
(rust-mode . lsp)
(nim-mode . lsp))
:commands lsp)
