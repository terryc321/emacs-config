
;; https://github.com/js-emacs/js2-refactor.el

(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(setq js2-skip-preprocessor-directives t)

(js2r-add-keybindings-with-prefix "C-c C-m")
;; eg. extract function with `C-c C-m ef`.
(define-key js2-refactor-mode-map (kbd "C-c C-e C-f") 'js2r-extract-function)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))


