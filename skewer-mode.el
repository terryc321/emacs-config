

(use-package skewer-mode
  :init
  ;;(global-set-key (kbd "C-x C-f") 'helm-find-files)
  nil
  :config
  ;;(helm-mode +1)
  nil
  )


;; (require 'js-comint)
;; (setq inferior-js-program-command "/home/terry/.nvm/versions/node/v18.8.0/bin/node --interactive")

;;(setenv "NODE_NO_READLINE" "1")
;; Use your favorited js mode here:

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;; (add-hook 'js2-mode-hook '(lambda () 
;;                 (local-set-key "\C-x\C-e" 
;;                        'js-send-last-sexp)
;;                 (local-set-key "\C-\M-x" 
;;                        'js-send-last-sexp-and-go)
;;                 (local-set-key "\C-cb" 
;;                        'js-send-buffer)
;;                 (local-set-key "\C-c\C-b" 
;;                        'js-send-buffer-and-go)
;;                 (local-set-key "\C-cl" 
;;                        'js-load-file-and-go)
;;                 ))
                

