

;; https://jeffkreeftmeijer.com/emacs-straight-use-package/
;;
;; use-package
;; straight

;; =======================================================
;;  The ~/.emacs.d/early-init.el file disables package.el to disable its auto-loading,
;; causing all packages to be loaded through straight.el in the init file:
;; Listing 6: early-init.el, disabling package.el
;; Disable package.el in favor of straight.el
;; (setq package-enable-at-startup nil)
;;========================================================

;;=========================================================
;; Install straight.el
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

;; Install use-package
(straight-use-package 'use-package)

;; Configure use-package to use straight.el by default
(use-package straight
  :custom (straight-use-package-by-default t))
;;========================================================

;; yellow on black
(load "/home/terry/emacs-config/colours.el")

;; no startup screen 
(load "/home/terry/emacs-config/default.el")

;; helm framework 
(load "/home/terry/emacs-config/helm.el")

;; projectile - project management
(load "/home/terry/emacs-config/projectile.el")

;; helm has its own swiper
;;(load "/home/terry/emacs-config/swiper.el")
(load "/home/terry/emacs-config/swiper-helm.el")


;; what does counsel do ? counsel-ag
(load "/home/terry/emacs-config/counsel.el")

(load "/home/terry/emacs-config/company.el")

;; yasnippet
(load "/home/terry/emacs-config/yasnippet.el")
(load "/home/terry/emacs-config/yasnippet-snippets.el")

;; flycheck

;; which key
(load "/home/terry/emacs-config/which-key.el")

;; prettier
(load "/home/terry/emacs-config/prettier.el")

;; web-beautify -- broke tide + 
;;(load "/home/terry/emacs-config/web-beautify.el")

;; iedit
(load "/home/terry/emacs-config/iedit.el")

;; eslint
;; npm init @eslint/config
(load "/home/terry/emacs-config/eslint.el")
;;(load "/home/terry/emacs-config/eslint-plugin-react.el")


;; hydra for keybindings
(load "/home/terry/emacs-config/hydra.el")

;; ========== javascript ide ===========
;; typescript-mode
;; lsp-ui
;; js2-mode
;; rjsx-mode
;; lsp-mode
;; yasnippet
;; tide
;; company
;; flycheck
;; paren
;;
(load "/home/terry/emacs-config/javascript-ide.el")


;; run-js
(load "/home/terry/emacs-config/js-comint.el")


;; skewer mode
;;(load "/home/terry/emacs-config/skewer-mode.el")











