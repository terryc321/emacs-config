
(use-package yasnippet-snippets
  :init
  ;;(global-set-key (kbd "C-x C-f") 'helm-find-files)
  nil
  :config
  nil
  (yas-global-mode t)
  ;; use Meta-j and Meta-k to jump between fields
(global-set-key (kbd "M-j") 'yas-next-field-or-maybe-expand)
(global-set-key (kbd "M-k") 'yas-prev-field)
)







