(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;(set-face-attribute 'default t :font "FiraCode")
(set-face-attribute 'default nil :height 200)

(setq gc-cons-threshold (* 1024 1024 100))

(shell-command "quicktangle ~/.config/emacs/config.org ~/.config/emacs/config.el")
(load-file "~/.config/emacs/config.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   '("18bec4c258b4b4fb261671cf59197c1c3ba2a7a47cc776915c3e8db3334a0d25" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "7a1190ad27c73888f8d16142457f59026b01fa654f353c17f997d83565c0fc65" "ed36f8e30f02520ec09be9d74fe2a49f99ce85a3dfdb3a182ccd5f182909f3ab" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "5cda52dd4e58e14dfc47470978adb7e457e66b389602e70a0485fc7e95755ca7" "50b64810ed1c36dfb72d74a61ae08e5869edc554102f20e078b21f84209c08d1" "80930c775cef2a97f2305bae6737a1c736079fdcc62a6fdf7b55de669fbbcd13" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "c25d5ef5851d3036897e21f66d26bc1fa2a5ba89dbd15540604884a2fd163cc1" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "bddc5cd70a98675ef72f4d59b01385540c39a8ab1c2b9921a1522dfa70ffa626" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "461e9e0d69636be8b5347a030f14b16c996c60a89e48c33f48bde51c32da3248" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "0ab2aa38f12640ecde12e01c4221d24f034807929c1f859cbca444f7b0a98b3a" "583148e87f779040b5349db48b6fcad6fe9a873c6ada20487e9a1ec40d845505" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" default))
 '(exwm-floating-border-color "#242530")
 '(fci-rule-color "#383838")
 '(highlight-tail-colors
   ((("#2c3e3c" "#2a3b2e" "green")
     . 0)
    (("#313d49" "#2f3a3b" "brightcyan")
     . 20)))
 '(inhibit-startup-screen t)
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(objed-cursor-color "#ff5555")
 '(org-agenda-files
   '("~/org/capture/personal_projects.org" "/home/semi/org/capture/inbox.org" "/home/semi/org/capture/school.org" "/home/semi/org/essential/inbox.org" "/home/semi/org/essential/events.org"))
 '(org-format-latex-options
   '(:foreground default :background default :scale 4.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(warning-suppress-types '((comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
