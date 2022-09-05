

;; after save file , make the buffer read-only so do not accidently modify its
;; contents

(defun buffer-background-read-only ()
  (interactive)
  (setq buffer-face-mode-face `(:background "RoyalBlue4" :foreground "white"))
  (buffer-face-mode 1))


(defun buffer-background-read-write ()
  (interactive)
  (setq buffer-face-mode-face `(:background "black" :foreground "white"))
  (buffer-face-mode 1))




;;(buffer-background-pink4)
;;(buffer-background-black)

(defun my-save-buffer(&optional arg)
  (interactive)
  (save-buffer arg)
  (read-only-mode t))

(global-set-key (kbd "C-x C-s") #'my-save-buffer)


(defun my-after-save-actions ()
  "Used in `after-save-hook'."
  (when (memq this-command '(save-buffer)) ;; save-some-buffers))
    ;; make the buffer read only again
    ;;(message "running after-save-actions")
    ;; make buffer read only
    (read-only-mode t)
    ;; change color of background to pink
     ;; (when buffer-read-only
     ;;    (buffer-background-pink4))
    ))

(add-hook 'after-save-hook 'my-after-save-actions)
                

;; make buffer pink if in read-only mode , or black trash mode.
(defun my-color-buffer-read-or-write ()
  "used in `my-after-save-actions'."
  ;;(message "read-only-mode %s" buffer-read-only)
  (if buffer-read-only
      (buffer-background-read-only)
    (buffer-background-read-write)))

(add-hook 'post-command-hook #'my-color-buffer-read-or-write)

(defun my-make-buffer-read-only()
  (read-only-mode t))


(add-hook 'find-file-hook #'my-make-buffer-read-only)


;; (defun my-color-buffer-black (sym newval operation where)
;;   " used when buffer-read-only status changed"
;;   (message "buffer %s changed read-only-status %s" (buffer-name) buffer-read-only))


;;buffer-read-only


;;(add-hook 'read-only-mode #'my-color-buffer-pink-or-black)
;;(add-variable-watcher buffer-read-only #'my-color-buffer-black) 


;; (format "%s" t)
;; (format "%s" nil)
;; (format "%s" -1)



;;(message "%s %b" "buffer read only" t)

;; (defun my-after-load-actions ()
;;   "Used in `after-load-hook'."
;;   (when (memq this-command '(load-buffer load-some-buffers))
;;     ;; make the buffer read only    
;;     ;; change color of background to pink 
;;     ))

;; (add-hook 'after-save-hook 'my-after-save-actions)


;; (defun buffer-background-red ()
;;   (interactive)
;;   (setq buffer-face-mode-face `(:background "red"))
;;   (buffer-face-mode 1))


