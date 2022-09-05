

(use-package hydra
  :init
  ;;(global-set-key (kbd "C-x C-f") 'helm-find-files)
  nil
  :config
  ;;(helm-mode +1)
  nil
  )

;;(require 'hydra)


(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))


(defhydra hydra-toggle (:color blue)
  "toggle"
  ("a" abbrev-mode "abbrev")
  ("d" toggle-debug-on-error "debug")
  ("f" auto-fill-mode "fill")
  ("t" toggle-truncate-lines "truncate")
  ("w" whitespace-mode "whitespace")
  ("q" nil "cancel"))


(global-set-key (kbd "C-c C-v") 'hydra-toggle/body)


