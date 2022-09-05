
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


(setq exec-path (append exec-path '("~/.nvm/versions/node/v11.12.0/bin")))

;; Disable lsp-ui flymake default integration

;; https://github.com/emacs-lsp/lsp-ui/issues/226

(setq lsp-prefer-flymake nil)


;;(use-package typescript-mode :ensure t)

(use-package lsp-ui :ensure t)

(use-package js2-mode :ensure t)

;;(use-package rjsx-mode :ensure t)


;; LSP requirements on the server

;; sudo npm i -g typescript-language-server; sudo npm i -g typescript

;; sudo npm i -g javascript-typescript-langserver


(use-package lsp-mode

:ensure t

:config

(require 'lsp-clients)

;; (add-hook 'typescript-mode-hook 'lsp)

(add-hook 'js2-mode-hook 'lsp)

(add-hook 'php-mode 'lsp)

(add-hook 'css-mode 'lsp)

(add-hook 'web-mode 'lsp))


(use-package company-lsp :ensure t)

(use-package yasnippet :ensure t)


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

;;(typescript-mode . "typescript")

))

;; LSP debugging

;;(setq lsp-print-io t)

;;(setq lsp-trace t)

;;(setq lsp-print-performance t)


And then a little tide:

(use-package tide

:ensure t

:init

(setq tide-tsserver-executable "~/.nvm/versions/node/v11.12.0/bin/tsserver"))


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

; aligns annotation to the right hand side

(setq company-tooltip-align-annotations t)


;; formats the buffer before saving

(add-hook 'before-save-hook 'tide-format-before-save)


(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-hook 'js2-mode-hook #'setup-tide-mode)

;; configure javascript-tide checker to run after default javascript checker

(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)




(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq package-enable-at-startup nil)

;; package-install use-package
(require 'use-package)

;;============ straight - emacs package manager=======================
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;;==================================================================

(use-package swiper)
(use-package helm)
(use-package projectile)
(use-package eldoc)
(use-package flycheck)
(use-package yasnippet)



;;
(defun setup()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f6>") #'setup)



;; ------- fix javascript shortcomings ---------
(defun my-function()
  (interactive)
  (insert "function(){return }")
  (backward-char 10)
  )
(global-set-key (kbd "<f2>") #'my-function)



;; (global-set-key (kbd "M-[") (lambda () (interactive) (insert "{")))


;; from emacs.wiki

;; put icicles under emacs.d directory
;;(add-to-list 'load-path "~/.emacs.d/lisp/icicles/")
;; doremi
;;(add-to-list 'load-path "~/.emacs.d/lisp/doremi/")




;; (set-background-color "grey")
;; (set-background-color "black")
;; (set-foreground-color "green")


(set-background-color "white")
(set-foreground-color "black")

(set-background-color "black")
(set-foreground-color "white")
(set-foreground-color "yellow")

;; set font use shift + mouse click = change buffer font
;; pick one like , then run describe-font
;; to see what you picked
;; goto customize
;; default face

;; -POOP-Fixedsys Excelsior 3.01-normal-normal-normal-*-21-*-*-*-*-0-iso10646-1
;;(set-frame-font "fixedsys excelsior 3.0.1 regular 14" nil t)
;;(set-frame-font "Inconsolata 12" nil t)Source Code Pro
;;(set-frame-font "Sans-serif 14" nil t)
;; (set-frame-font "Monospace 14" nil t)
;; (set-frame-font "Sans-serif 12" nil t)
;;(face-attribute 'default :font)
(set-frame-font "Source Code Pro 12" nil t)
;;(set-frame-font "Fixedsys 10" nil t)

(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-12"))



(tool-bar-mode -1)
;;(scroll-bar-mode -1)
(menu-bar-mode -1)

;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
;; (package-initialize)

;;(length package-archives)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-enabled-themes '(afternoon))
;;  '(custom-safe-themes
;;    '("c07daf599a7d07a18faaf354d269c48d4462ff7dbdbcc3773950a4b37b003d80" "d678ec420b0ede7ace7adb0fa9f448329e132de2f868b20773e282eb29fb1498" "c3c39b9bf9824d4fa591fbf785a2cb507607f2f36fef05363d6f2dca5c6db82b" "62fcab88d19e2b4110439489ece7bd4318c1d25d5ec48de9bb9e3123d3ab8419" "70f5a47eb08fe7a4ccb88e2550d377ce085fedce81cf30c56e3077f95a2909f2" "957a573d5c7cb49c2f033b9d5a6f77445c782307e2d7ffca0d9b5b8141c49843" "cbd85ab34afb47003fa7f814a462c24affb1de81ebf172b78cb4e65186ba59d2" "16ab866312f1bd47d1304b303145f339eac46bbc8d655c9bfa423b957aa23cc9" "6b6bad9d7a844d5de02761a1bd155869512f47bd6a7b14d799eea5c37f08ead4" "9b4ae6aa7581d529e20e5e503208316c5ef4c7005be49fdb06e5d07160b67adc" "fe36e4da2ca97d9d706e569024caa996f8368044a8253dc645782e01cd68d884" "1fbd63256477789327fe429bd318fb90a8a42e5f2756dd1a94805fc810ae1b62" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "33ea268218b70aa106ba51a85fe976bfae9cf6931b18ceaf57159c558bbcd1e6" "ffba0482d3548c9494e84c1324d527f73ea4e43fff8dfd0e48faa8fc6d5c2bc7" "8f5b54bf6a36fe1c138219960dd324aad8ab1f62f543bed73ef5ad60956e36ae" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" "919fabfc5cb6165ce07b9d8668f78fe75fe8bd08566006bc87513c29b4f34ade" "3d4df186126c347e002c8366d32016948068d2e9198c496093a96775cc3b3eaa" "84f6d5b890c59522d765c5610ff75b38d1716683606116cf9354b5fac4c4c35d" "c7eb06356fd16a1f552cfc40d900fe7326ae17ae7578f0ef5ba1edd4fdd09e58" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "a94f1a015878c5f00afab321e4fef124b2fc3b823c8ddd89d360d710fc2bddfc" "6b234feec8db588ad5ec2a9d9d7b935f7a155104b25ccfb94d921c45a2ff7d22" "e7ce09ff7426c9a290d06531edc4934dd05d9ea29713f9aabff834217dbb08e4" "bf10bd6d21928bf87bc3032b498c62cb9d48c54c06d217c8b00bef8090e539f7" "a8e9953f429517bd62a0bf136b081b436fd429ee1d445bc311d7eee83679d151" "126d30c137a7e345193d7f77f5b2af92d9669ebf60ed81346c897dbe16f40376" "a068a281383f92b622a058ec29755c6ae9f226c5e444ed126c05f71ba17570e5" "e375c943dbc6cac4242684b7507ef97d30c4b4725614660c15b101cb50c66277" "616a43bd873b09e966e837c7138e5b2561b3442b92723d21b8c80166f3ecd9f3" default))
;;  '(inhibit-startup-screen t)
;;  '(package-selected-packages
;;    '(use-package tide consult-eglot eglot xref-js2 discover-js2-refactor js2-refactor zweilight-theme zerodark-theme zeno-theme zenburn-theme zen-and-art-theme yoshi-theme xresources-theme white-theme white-sand-theme weyland-yutani-theme warm-night-theme waher-theme vscode-dark-plus-theme vscdark-theme vs-light-theme vs-dark-theme vegetative-theme vampyricdark-theme uwu-theme unobtrusive-magit-theme underwater-theme undersea-theme ujelly-theme ubuntu-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tron-legacy-theme tramp-theme toxi-theme tommyh-theme tok-theme timu-spacegrey-theme timu-rouge-theme theme-magic theme-looper theme-changer theme-anchor the-matrix-theme termbright-theme tao-theme tangotango-theme tangonov-theme tango-plus-theme tango-2-theme sweet-theme svg-mode-line-themes suscolors-theme sunny-day-theme sunburn-theme sublime-themes subatomic256-theme subatomic-theme stimmung-themes starlit-theme srcery-theme spacemacs-theme spaceline-all-the-icons spacegray-theme space-theming sourcerer-theme soria-theme sorcery-theme soothe-theme solo-jazz-theme soft-stone-theme soft-morning-theme soft-charcoal-theme snazzy-theme smyx-theme smart-mode-line-powerline-theme smart-mode-line-atom-one-dark-theme slime-theme sketch-themes simplicity-theme silkworm-theme shanty-themes shades-of-purple-theme sexy-monochrome-theme seti-theme seoul256-theme select-themes sculpture-themes sakura-theme rimero-theme reykjavik-theme reverse-theme remember-last-theme rebecca-theme rand-theme railscasts-theme railscasts-reloaded-theme quasi-monochrome-theme qtcreator-theme purple-haze-theme purp-theme punpun-theme professional-theme prassee-theme poet-theme planet-theme plan9-theme plain-theme phoenix-dark-pink-theme phoenix-dark-mono-theme peacock-theme pastelmac-theme parchment-theme paper-theme panda-theme paganini-theme overcast-theme organic-green-theme org-beautify-theme orangey-bits-theme one-themes omtose-phellack-theme oldlace-theme oceanic-theme occidental-theme obsidian-theme oblivion-theme nyx-theme nubox ns-auto-titlebar nova-theme notink-theme nothing-theme northcode-theme nordless-theme nord-theme nofrils-acme-theme noctilux-theme nimbus-theme night-owl-theme naysayer-theme naquadah-theme nano-theme naga-theme mustard-theme mustang-theme morgentau-theme mood-one-theme monotropic-theme monokai-theme monokai-pro-theme monokai-alt-theme monochrome-theme molokai-theme moe-theme minsk-theme minimal-theme mindre-theme metalheart-theme mellow-theme mbo70s-theme material-theme mandm-theme majapahit-theme madhat2r-theme lush-theme load-theme-buffer-local liso-theme light-soap-theme leuven-theme lavenderless-theme lavender-theme laguna-theme lacquer labburn-theme lab-themes kuronami-theme kosmos-theme kooten-theme klere-theme kaolin-themes jetbrains-darcula-theme jbeans-theme jazz-theme ir-black-theme iodine-theme inverse-acme-theme intellij-theme inkpot-theme immaterial-theme idea-darkula-theme iceberg-theme hydandata-light-theme hybrid-reverse-theme humanoid-themes horizon-theme heroku-theme hemisu-theme hemera-theme heaven-and-hell hc-zenburn-theme hamburg-theme habamax-theme gtk-variant gruvbox-theme gruber-darker-theme greymatters-theme grey-paper-theme green-screen-theme green-phosphor-theme green-is-the-new-black-theme grayscale-theme graphene-meta-theme grandshell-theme gotham-theme goose-theme github-theme github-modern-theme github-dark-vscode-theme gandalf-theme forest-blue-theme foggy-night-theme flucui-themes flatui-theme flatui-dark-theme flatland-theme flatland-black-theme flatfluc-theme firecode-theme farmhouse-theme fantom-theme faff-theme eziam-theme exotica-theme ewal-spacemacs-themes ewal-doom-themes ewal espresso-theme enlightened-theme elegant-agenda-mode eink-theme eclipse-theme dream-theme dracula-theme doom-themes django-theme distinguished-theme display-theme darktooth-theme darkokai-theme darkmine-theme darkburn-theme dark-mint-theme dark-krystal-theme darcula-theme danneskjold-theme dakrone-theme dakrone-light-theme cyberpunk-theme cyberpunk-2019-theme cyanometric-theme curry-on-theme creamsody-theme constant-theme commentary-theme colorless-themes color-theme-x color-theme-tangotango color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-modern color-theme-buffer-local color-theme-approximate color-theme colonoscopy-theme clues-theme cloud-theme chyla-theme chocolate-theme cherry-blossom-theme challenger-deep-theme catppuccin-theme caroline-theme calmer-forest-theme busybee-theme bubbleberry-theme brutalist-theme boron-theme borland-blue-theme bliss-theme blackboard-theme birds-of-paradise-plus-theme berrys-theme basic-theme base16-theme badwolf-theme badger-theme ayu-theme avk-emacs-themes autumn-light-theme autothemer auto-dark atom-one-dark-theme atom-dark-theme arjen-grey-theme arc-dark-theme apropospriate-theme anti-zenburn-theme ancient-one-dark-theme ample-zen-theme ample-theme almost-mono-themes alect-themes airline-themes aircon-theme ahungry-theme afternoon-theme acme-theme abyss-theme helm-cider helm-clojuredocs helm-codesearch helm-commandlinefu helm-company helm-cscope helm-dash helm-descbinds helm-describe-modes helm-dictionary helm-dired-history helm-dirset helm-dogears helm-emmet helm-emms helm-esa helm-etags-plus helm-evil-markers helm-eww helm-ext helm-file-preview helm-firefox helm-fish-completion helm-flycheck helm-flymake helm-flyspell helm-frame helm-fuz helm-fuzzier helm-fuzzy helm-fuzzy-find helm-ghq helm-git helm-git-grep helm-go-package helm-google helm-grepint helm-gtags helm-helm-commands helm-hoogle helm-hunks helm-icons helm-idris helm-img helm-img-tiqav helm-itunes helm-j-cheatsheet helm-jira helm-js-codemod helm-jstack helm-kythe helm-lastpass helm-lean helm-lib-babel helm-lines helm-lobsters helm-ls-svn helm-mu helm-navi helm-org-recent-headings helm-osx-app helm-phpunit helm-posframe helm-prosjekt helm-rage helm-rails helm-rb helm-rhythmbox helm-ros helm-rubygems-local helm-safari helm-selected helm-sheet helm-shell-history helm-spotify helm-spotify-plus helm-sql-connect helm-switch-shell helm-systemd helm-tail helm-tree-sitter helm-twitch helm-wikipedia helm-wordnet helm-xcdoc helm-youtube helm-z dash epl f flymake-easy flymake-jslint font-utils ht json-snatcher list-utils lv modus-themes pcache persistent-soft pkg-info s slime-volleyball markdown-mode yasnippet yasnippet-snippets ivy-yasnippet solarized-theme cycle-themes ef-themes modus-vivendi-theme modus-operandi-theme rainbow-blocks rainbow-identifiers paredit fontawesome dynamic-fonts exec-path-from-shell web-mode json-mode flycheck flycheck-clojure lsp-mode js2-mode js-format async clojure-mode company compat fuz macrostep parseclj parseedn popup queue seq sesman spinner transient which-key helm-core ivy swiper swiper-helm counsel-projectile ivy-fuz projectile cider slime-company highlight-parentheses paren-face slime geiser-chicken geiser-guile geiser-mit geiser-racket geiser counsel)))



(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
      ;;  "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
      ;;  "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
        ))

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.
;;(yas-reload-all)

 
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;(setq projectile-project-search-path '("~/northcoders/" "~/work/" ("~/github" . 1)))
(setq projectile-project-search-path '("~/northcoders/"))

(helm-mode +1)
(global-set-key (kbd "C-x C-f") #'helm-find-files)


(add-hook 'text-mode-hook #'auto-fill-mode)
(setq-default fill-column 80)
;;(add-hook 'prog-mode-hook #'auto-fill-mode)
;;(remove-hook 'prog-mode-hook #'auto-fill-mode)


;;(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'ivy-mode)
(add-hook 'lisp-mode-hook #'company-mode)

(add-hook 'common-lisp-mode-hook #'ivy-mode)
(add-hook 'common-lisp-mode-hook #'company-mode)


(add-hook 'js-mode-hook #'auto-fill-mode)
(add-hook 'js-mode-hook #'ivy-mode)
(add-hook 'js-mode-hook #'company-mode)

;; ===================== javascript config =============
;; ripped from
;; https://emacs.cafe/emacs/javascript/setup/2017/04/23/emacs-setup-javascript.html
;; ===============================================================================
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;;=====================================================================

;;(autoload 'lisp-mode "slime" "load slime when lisp files around." t)
(require 'slime)
(require 'slime-autoloads)
;; (require 'slime)
;;(require 'slime-contribs)

;;(require 'slime-contribs)



;; Set your lisp system and some contribs
(setq inferior-lisp-program "/opt/sbcl-2.2.6/bin/sbcl")
(add-hook 'lisp-mode-hook #'slime-lisp-mode-hook)
(add-hook 'common-lisp-mode-hook #'slime-lisp-mode-hook)
(setq slime-contribs '(
		       slime-company
		       slime-scratch
		       slime-fuzzy
		       slime-fancy
		       slime-scratch
		       slime-editing-commands
		       slime-fancy
		       slime-parse
		       slime-repl
		       slime-autodoc
		       slime-c-p-c
		       slime-fancy-inspector
		       slime-fancy-trace
		       slime-fuzzy
		       slime-enclosing-context
		       slime-mdot-fu
		       slime-macrostep
		       slime-presentations
		       slime-compiler-notes-tree
		       slime-references
		       slime-package-fu
		       slime-fontifying-fu
		       slime-trace-dialog
		       slime-indentation
		       ))

(slime-setup)
(eval-after-load "slime-contribs"
   (progn
     (setq slime-complete-symbol-function #'slime-fuzzy-complete-symbol)
     ;;((lambda () (interactive)(slime-scratch)))
     ))



(defun forward-paragraph-and-eval-last-expression()
  (interactive)
  (forward-paragraph)
  (slime-eval-last-expression))

(global-set-key (kbd "<f5>") #'forward-paragraph-and-eval-last-expression)

;; collect all
(global-set-key (kbd "C-c C-a") #'slime-eval-buffer) 


;;(global-set-key (kbd "C-x C-e") #'slime-eval-last-expression) 
;;(global-set-key (kbd "C-x C-e") #'eval-last-sexp) 

;;current-mode-map
;;(current-local-map)

;;(define-key lisp-mode-map [C-f1] 'python-describe-symbol)
;;(define-key emacs-lisp-mode-map "C-x C-e" #'eval-last-sexp)
;;(local-set-key "C-x C-e" #'eval-last-sexp)

;; (+ 1 2)
;; (* 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35)

;; (mapcar #'+ '(1 2 3) '(4 5 6))

(setq display-line-numbers 'relative)
(global-set-key (kbd "C-c l") 'display-line-numbers-mode)

;;(setq display-line-numbers-current-absolute t)
(global-display-line-numbers-mode -1)

;;(add-hook 'lisp-mode-hook #'company-mode-hook)

;;; js-beautify.el -- beautify some js code

(defgroup js-beautify nil
  "Use jsbeautify to beautify some js"
  :group 'editing)

(defcustom js-beautify-args "--jslint-happy --brace-style=end-expand --keep-array-indentation"
  "Arguments to pass to jsbeautify script"
  :type '(string)
  :group 'js-beautify)

(defcustom js-beautify-path "~/projects/js-beautify/python/jsbeautifier.py"
  "Path to jsbeautifier python file"
  :type '(string)
  :group 'js-beautify)

(defun js-beautify ()
  "Beautify a region of javascript using the code from jsbeautify.org"
  (interactive)
  (let ((orig-point (point)))
    (unless (mark)
      (mark-defun))
    (shell-command-on-region (point)
                             (mark)
                             (concat "js-beautify" ;;"python "
                                     ;; js-beautify-path
                                     " --stdin "
                                     js-beautify-args)
                             nil t)
    (goto-char orig-point)))

(defun js-beautify-all ()
  "Beautify a region of javascript using the code from jsbeautify.org"
  (interactive)
  (let ((orig-point (point)))
    (unless (mark)
      (mark-defun))
    (shell-command-on-region (point-min)
                             (point-max)
                             (concat "js-beautify" ;;"python "
                                     ;; js-beautify-path
                                     " --stdin "
                                     js-beautify-args)
                             nil t)
    (goto-char orig-point)))


(provide 'js-beautify)
;;; js-beautify.el ends here

;; ????????????
;; (eval-after-load 'javascript
;;   '(define-key js-mode-map (kbd "C-c b") 'js-beautify))


(global-set-key (kbd "<f7>") 'js-beautify-all)
;;(local-set-key "\M-t" 'js-beautify)

;; intalled jslint
;; sudo npm install -g jslint
;; 
;; sudo /opt/node/bin/npm install -g jslint
;;
;;-------------- flymake deprecated - use flycheck instead --------------
;; M-x package-install flymake-jslint
;; (require 'flymake) ;; Not necessary if using ELPA package
;; (require 'flymake-jslint) ;; Not necessary if using ELPA package
;; (add-hook 'js-mode-hook 'flymake-jslint-load)
;; (add-hook 'js-mode-hook
;; 	  (lambda () (flymake-mode t)))
;; (setq flymake-jslint-args ())
;; (setq flymake-jslint-command "jslint")
;;-------------------------------------------------

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))



;;setup slime for sbcl
; Setup load-path, autoloads and your lisp system
;; Not needed if you install SLIME via MELPA
;;(add-to-list 'load-path "~/dir/to/cloned/slime")

;;(require 'slime)

;; ;;(require 'slime-autoloads)
;; ;;(require 'slime-contribs)
;; ;;(add-hook 'lisp-mode-hook #'slime)
;; (autoload 'lisp-mode "slime" "load slime when lisp files around." t)
;; (autoload 'lisp-mode "slime-contribs" "load slime when lisp files around." t)
;; (add-to-list 'slime-contribs 'inferior-slime)
;; (add-to-list 'slime-contribs 'slime-autodoc)
;; (add-to-list 'slime-contribs 'slime-repl)
;; (add-to-list 'slime-contribs 'slime-editing-commands)
;; (add-to-list 'slime-contribs 'slime-fancy)






;; (eval-after-load "slime-contribs"
;;   (progn
;;     (setq slime-complete-symbol-function #'slime-fuzzy-complete-symbol)
    
;;     (dolist (s 
;; 	     '(slime-parse slime-repl
;; 			   slime-autodoc slime-editing-commands slime-c-p-c
;; 			   slime-fancy-inspector slime-fancy-trace slime-fuzzy
;; 			   slime-enclosing-context slime-mdot-fu slime-macrostep
;; 			   slime-presentations slime-scratch
;; 			   slime-compiler-notes-tree slime-references
;; 			   slime-package-fu slime-fontifying-fu slime-trace-dialog
;; 			   slime-indentation slime-fancy)
;; 	     nil)
;;       (add-to-list 'slime-contribs s))))




;; ;;(require 'paredit)
;; (eval-after-load "paredit"
;;   (progn
;;     ;; paredit autoload
;;     (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;;     (add-hook 'clojure-mode #'enable-paredit-mode)
;;     (add-hook 'clojurescript-mode #'enable-paredit-mode)
;;     ;;lisp-mode-hook
;;     ;; lisp files --- should be in paredit mode when load .lisp file
;;     (add-hook 'slime-mode-hook #'enable-paredit-mode)
;;     (add-hook 'scheme-mode-hook #'enable-paredit-mode)
;;     )
;;   )



;;(which-key-mode)
;;swiper
;;counsel
;;cider
;;company ??
;;ivy ??


;; (defun my-fix-lisp-mode ()
;;   (interactive)
;;   (ivy-mode)
;;   )


;; (require 'ivy)
;; (eval-after-load "ivy"
;;   (progn
;;     (add-hook 'lisp-mode #'ivy-mode)
;;     ))




;; ;; typescript
;; ;;(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
;; ;;(add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode))
;; ;;(add-to-list 'auto-mode-alist '("\\.el\\'" . elisp-mode))
;; ;;(add-to-list 'auto-mode-alist '("\\[.]el\\'" . emacs-lisp-mode))
;; ;;(autoload 'lisp-mode "ivy" "load ivy when lisp files around." t)

;; (defun my-major-mode ()
;;   (interactive)
;;   (message (format "the major mode is %s" major-mode)))

;;---------------
;; counsel
;; swiper
;; cider
;; helm
;; ivy
;; company
;; which-key-mode
;; paredit
;;------------




;; Ivy-based interface to standard commands
;; Ivy-based interface to shell and system tools


;; (ivy-mode 1)
;; (setq ivy-use-virtual-buffers t)
;; (setq ivy-count-format "(%d/%d) ")

;;     (global-set-key (kbd "C-s") 'swiper-isearch)
;;     (global-set-key (kbd "M-x") 'counsel-M-x)
;;     (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;     (global-set-key (kbd "M-y") 'counsel-yank-pop)
;;     (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;     (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;     (global-set-key (kbd "<f1> l") 'counsel-find-library)
;;     (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;     (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;     (global-set-key (kbd "<f2> j") 'counsel-set-variable)
;;     (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
;;     (global-set-key (kbd "C-c v") 'ivy-push-view)
;;     (global-set-key (kbd "C-c V") 'ivy-pop-view)


;;     (global-set-key (kbd "C-c c") 'counsel-compile)
;;     (global-set-key (kbd "C-c g") 'counsel-git)
;;     (global-set-key (kbd "C-c j") 'counsel-git-grep)
;;     (global-set-key (kbd "C-c L") 'counsel-git-log)
;;     (global-set-key (kbd "C-c k") 'counsel-rg)
;;     (global-set-key (kbd "C-c m") 'counsel-linux-app)
;;     (global-set-key (kbd "C-c n") 'counsel-fzf)
;;     (global-set-key (kbd "C-x l") 'counsel-locate)
;;     (global-set-key (kbd "C-c J") 'counsel-file-jump)
;;     (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;;     (global-set-key (kbd "C-c w") 'counsel-wmctrl)

;;     (global-set-key (kbd "C-c C-r") 'ivy-resume)
;;     (global-set-key (kbd "C-c b") 'counsel-bookmark)
;;     (global-set-key (kbd "C-c d") 'counsel-descbinds)
;;     (global-set-key (kbd "C-c g") 'counsel-git)
;;     (global-set-key (kbd "C-c o") 'counsel-outline)
;;     (global-set-key (kbd "C-c t") 'counsel-load-theme)
;;     (global-set-key (kbd "C-c F") 'counsel-org-file)

;; Ivy-resume and other commands

;;     ivy-resume resumes the last Ivy-based completion.


;;You can also enable counsel-mode to make some global key binding remapping for you.

;; ------------ javascript prettier based on eslint -------------------
;; ----------- it does not work
;; ------------ no eslint_d program in path anywhere i can find
;;--------------------------------------------------------------------
;; ;; then require the package in your config
;; (require 'js-format)

;; ;; using "standard" as js formatter
;; (eval-after-load 'js2-mode
;;   (add-hook 'js2-mode-hook
;;             (lambda()
;;               (js-format-setup "standard"))))

;; ;;using "jsbeautify-css" as css formatter
;; (eval-after-load 'css-mode
;;   (add-hook 'css-mode-hook
;;             (lambda()
;;               (js-format-setup "jsb-css"))))


;; ;;(global-set-key (kbd "M-,") 'js-format-mark-statement)
;; (global-set-key (kbd "C-x j j") 'js-format-region)
;; (global-set-key (kbd "C-x j b") 'js-format-buffer)


;; (defun eslint-formatter (&optional b e)
;;       "formats the selected text to format the js"
;;     (interactive "r")
;;     (call-process-region (point-max) (point-min) "eslint_d" t t nil "--stdin"
;; 			 "--fix-to-stdout"))



(progn
  
  ;; (global-set-key (kbd "M-[") (lambda () (interactive) (insert "{")))
  ;; (global-set-key (kbd "M-]") (lambda () (interactive) (insert "}")))

  ;; (global-set-key (kbd "[") (lambda () (interactive) (insert "(") ))
  ;; (global-set-key (kbd "]") (lambda () (interactive) (insert ")") ))

  ;; (global-set-key (kbd "{") (lambda () (interactive) (insert "[") ))
  ;; (global-set-key (kbd "}") (lambda () (interactive) (insert "]") ))

  )










;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "POOP" :family "Fixedsys Excelsior 3.01")))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))


;;(set-frame-font "Fira Code Retina 12" nil t)

(set-frame-font "Source Code Pro 12" nil t)
;;(set-frame-font "ProggyVector Regular 12" nil t)
(set-frame-font "ProggyVector 14" nil t)
(set-frame-font "ProggyVector 12" nil t)
(set-frame-font "ProggyVector 10" nil t)
(set-frame-font "ProggyVector 8" nil t)

;;(set-frame-font "Fixedsys 10" nil t)


(add-to-list 'default-frame-alist
             '(font . "ProggyVector-12"))

(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-12"))


;; --- emmet setup ---

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))

;;If you disable indent-region, you can set the default indent level thusly:

(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.

;;If you want the cursor to be positioned between first empty quotes after expanding:

(setq emmet-move-cursor-between-quotes t) ;; default nil

;;Or if you don't want to move cursor after expanding:

(setq emmet-move-cursor-after-expanding nil) ;; default t

;;If you want to customize Self-closing tags style:

(setq emmet-self-closing-tag-style " /") ;; default "/"

;; only " /", "/" and "" are valid.
;; eg. <meta />, <meta/>, <meta>

;;(add-to-list 'emmet-jsx-major-modes 'your-jsx-major-mode)

;; ================= multiple cursors ==============================

;; (global-unset-key (kbd "M-<down-mouse-1>"))
;; (global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)


(use-package multiple-cursors
  :straight t
  :ensure   t
  :bind ( ;;("H-SPC" . set-rectangular-region-anchor)
         ("C-M-SPC" . set-rectangular-region-anchor)
         ("C->" . mc/mark-next-like-this) 	 
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C->" . mc/mark-all-like-this)
         ("C-c C-SPC" . mc/edit-lines)
         ))

;; (require 'multiple-cursors)
;; (with-eval-after-load 'multiple-cursors-core
;;   (define-key mc/keymap (kbd "C-<escape>") 'mc/keyboard-quit))

;; ;;===== cobbled together bubble n squeak of multiple-cursors configs =======
;; (defun mc/toggle-cursor-at-point ()
;;   "Add or remove a cursor at point."
;;   (interactive)
;;   (if multiple-cursors-mode
;;       (message "Cannot toggle cursor at point while `multiple-cursors-mode' is active.")
;;     (let ((existing (mc/fake-cursor-at-point)))
;;       (if existing
;;           (mc/remove-fake-cursor existing)
;;         (mc/create-fake-cursor-at-point)))))


;; ;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; ;; (global-set-key (kbd "C-c C-S") 'mc/edit-lines)
;; ;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; ;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; ;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; (add-to-list 'mc/cmds-to-run-once 'mc/toggle-cursor-at-point)


;; ;; (add-to-list 'mc/cmds-to-run-once 'multiple-cursors-mode)

;; ;; ;;(global-set-key (kbd "C-S-SPC") 'mc/toggle-cursor-at-point)
;; ;; ;;(global-set-key (kbd "<C-S-return>") 'multiple-cursors-mode)
;; (global-set-key (kbd "C-.") 'mc/toggle-cursor-at-point)
;; ;; (global-set-key (kbd "<ret>") 'self-insert)
;; ;; (define-key mc-mode-map (kbd "RET") 'newline)

;; (defun my-mc-mod()(interactive) (multiple-cursors-mode "toggle"))
;; (global-set-key (kbd "C-m") 'my-mc-mod)
;; (lambda ()(interactive)(multiple-cursors-mode -1))


;; ;; ;; ;; over-ride markdown mode C-m binding
;; ;; ;; (define-minor-mode markdown-normal-mode
;; ;; ;; 	"markdown-mode extensions for vas-normal-mode"
;; ;; ;; 	:keymap (define-new-keymap (alist
;; ;; ;; 		"C-m" #'vas-markdown-edit-code)))
 
;; ;; ;; (with-eval-after-load 'markdown-mode
;; ;; ;; 	(define-key markdown-mode-map (kbd "<return>") #'newline-and-indent-relative)
;; ;; ;; 	(define-key markdown-mode-map (kbd "C-c '") #'vas-markdown-edit-code)
;; ;; ;; 	(add-hook 'markdown-mode-hook (lambda ()
;; ;; ;; 		(when vas-normal-mode (markdown-normal-mode))
;; ;; ;; 		(setq-local vas-normal-bonus-mode #'markdown-normal-mode))))
;; ;; ;; (global-set-key (kbd "some keybind") 'mc/keyboard-quit)


;; ;; ;;EDIT: Also need to check in .mc-lists.el keyboard-escape-quit should be in

;; (setq mc/cmds-to-run-for-all
;;       '(multiple-cursors-mode
;;         keyboard-escape-quit))

;; (global-set-key (kbd "C-<escape>") 'mc/keyboard-quit)

(setq helm-mode-fuzzy-match t)

;; -------------------------------------------
(defun my-rectangle-edit-function()
  (interactive)
  (insert "function(){return }")
  (backward-char 10)
  )
(global-set-key (kbd "C-x r e") #'iedit-rectangle-mode)

;;(require 'multiple-cursors)
(global-set-key (kbd "C-#") #'(lambda ()
				(interactive)
				(multiple-cursors-mode -1)
				(message "%s" "escape multiple-cursors" )))



;;(global-set-key (kbd "C-.") 'mc/toggle-cursor-at-point)
(global-set-key (kbd "C-.") #'mc/keyboard-quit)

;; disable multiple-cursors
;; ( 
;; (lambda()
;;   (interactive)
;;   (multiple-cursors-mode -1))
;; )

;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

;; when call dangerous routine - should
;; tell emacs we know a little to be dangerous
(put 'narrow-to-region 'disabled nil)
