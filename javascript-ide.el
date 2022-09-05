


;;(setq exec-path (append exec-path '("~/.nvm/versions/node/v11.12.0/bin")))
(setq exec-path (append exec-path '("/home/terry/.nvm/versions/node/v18.8.0/bin")))

;; Disable lsp-ui flymake default integration
;; https://github.com/emacs-lsp/lsp-ui/issues/226
(setq lsp-prefer-flymake nil)

(use-package typescript-mode :ensure t)
(use-package lsp-ui :ensure t)
(use-package js2-mode :ensure t)
(use-package rjsx-mode :ensure t)
;; LSP requirements on the server
;; sudo npm i -g typescript-language-server
;; sudo npm i -g typescript
;; sudo npm i -g javascript-typescript-langserver


(use-package lsp-mode
  :ensure t
  :config ;;(require 'lsp-clients)
  (add-hook 'typescript-mode-hook 'lsp)
  (add-hook 'js2-mode-hook 'lsp)
  (add-hook 'php-mode 'lsp)
  (add-hook 'css-mode 'lsp)
  (add-hook 'web-mode 'lsp))

                            
;; ? what happened to company-lsp
;;(use-package company-lsp :ensure t)
(use-package yasnippet :ensure t)

(global-set-key (kbd "<backtab>") 'yas-expand)
;;(global-set-key (kbd "TAB") 'hippie-expand)
;;(global-set-key (kbd "TAB") #'(lambda ()(interactive) (insert "    ")))


(setq lsp-language-id-configuration '((java-mode . "java")
				      (python-mode . "python")
				      (gfm-view-mode . "markdown")
				      (rust-mode . "rust")
				      (css-mode . "css")
				      (xml-mode . "xml")
				      (c-mode . "c")
				      (c++-mode . "cpp")
				      (objc-mode . "objective-c")
				      (web-mode . "html")
				      (html-mode . "html")
				      (sgml-mode . "html")
				      (mhtml-mode . "html")
				      (go-mode . "go")
				      (haskell-mode . "haskell")
				      (php-mode . "php")
				      (json-mode . "json")
				      (js2-mode . "javascript")
				      (typescript-mode . "typescript")
				      ))

;; LSP debugging

;;(setq lsp-print-io t)
;;(setq lsp-trace t)
;;(setq lsp-print-performance t)


;;And then a little tide:
(use-package tide
  :ensure t
  :init
  (setq tide-tsserver-executable "/home/terry/.nvm/versions/node/v18.8.0/bin/tsserver"))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; \M-x package-install [ret] company``
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)


;; formats the buffer before saving
;;(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'js2-mode-hook #'setup-tide-mode)

;; configure javascript-tide checker to run after default javascript checker

;; disable jshint since we prefer eslint checking
;; (setq-default flycheck-disabled-checkers
;;   (append flycheck-disabled-checkers
;;     '(javascript-jshint)))

(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)

(use-package paren
  :ensure nil
  :init
  (setq show-paren-delay 0)
  :config
  (show-paren-mode +1))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


