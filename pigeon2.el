(use-package ryo-modal
  :straight t
  :ensure t)

(use-package key-chord
  :straight t)

(setq ryo-modal-cursor-type 'box)
(setq ryo-modal-cursor-color nil)
(setq-default cursor-type 'bar)

(ryo-modal-keys
 ("d" left-char)
 ("a" right-char)
 ("u" previous-line)
 ("e" next-line)
 ("D" left-word)
 ("A" right-word)
 ("U" backward-sentence)
 ("E" forward-sentence)
 )

(ryo-modal-keys
 ("k" kill-line)
 ("y" yank)
 ("c" kill-ring-save)
 ("C" kill-region)

 ("," isearch-backward)
 ("." isearch-forward)
 )

(ryo-modal-keys
 ("t" transpose-chars)
 ("T" transpose-words))

;;(key-chord-define ryo-modal-mode-map "tl" transpose-lines)

(global-set-key (kbd "<escape>") 'ryo-modal-mode)
