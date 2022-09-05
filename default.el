

(setq make-backup-files t)
;; (setq auto-save-file-name-transforms
;;           `((".*" ,(concat user-emacs-directory "auto-save/") t))) 

 (setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
    )


;; indents 4 chars
(setq c-basic-offset 4)

; and 4 char wide for TAB
(setq tab-width 4)

; And force use of spaces
(setq indent-tabs-mode nil) 

 ; same as syntax on in Vim
(turn-on-font-lock)

;line numbers
;;(setq width (max width (+ (length str) 1)))   

;; hide welcome screen
(setq inhibit-startup-screen t) 

(global-visual-line-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;Let's turn off unwanted window decoration.


(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)
