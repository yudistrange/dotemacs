;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                          ;;
;; Check and install el-get ;;
;;                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                           ;;
;; Install required packages ;;
;;                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq
 my:el-get-packages
 '(el-get

   ;; Misc
   auto-complete
   better-defaults
   projectile
   undo-tree

   ;; Color themes
   color-theme
   color-theme-almost-monokai
   color-theme-zenburn
   rainbow-delimiters
   rainbow-mode

   ;; Clojure
   clojure-mode
   clj-refactor
   cider
   ac-cider
   paredit

   ;; Haskell
   ac-ghc-mod
   haskell-mode))
   
(el-get 'sync my:el-get-packages)

;;;;;;;;;;;;;;;;;;;;;;;;
;;                    ;;
;; Clojure Mode Hooks ;;
;;                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "<em>nrepl</em>")

;; General Auto-Complete
(require 'auto-complete-config)
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

;; ac-cider (Auto-complete for the nREPL)
(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(add-to-list 'ac-modes 'cider-mode)
(add-to-list 'ac-modes 'cider-repl-mode)

;; Poping-up contextual documentation
(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "s-d") 'ac-cider-popup-doc))

;; Add Paredit mode
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; Show parenthesis mode
(show-paren-mode 1)

;; rainbow delimiters
;; (global-rainbow-delimiters-mode)

;; Global key shortcuts
(global-set-key [f8] 'other-frame)
(global-set-key [f7] 'paredit-mode)
(global-set-key [f9] 'cider-jack-in)

;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     ;;
;; Set the color theme ;;
;;                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'color-theme)
;(color-theme-initialize) ;; required first time
(color-theme-dark-laptop)

;;;;;;;;;;;;;;;;;;;;;;
;;                  ;;
;; Set default font ;;
;;                  ;;
;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-13"))

;; Disable popup boxes
;(setq use-dialog-box nil)

;; Set exec PATH
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; Fullscreen
(toggle-frame-fullscreen)

;; Helm setting
(require 'helm-config)
(require 'helm-cmd-t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-t") 'helm-cmd-t)
(setq helm-buffers-list t)
(setq helm-M-x-fuzzy-match t)
(setq helm-locate-fuzzy-match t)

;; Set linum-mode
(setq linum-mode t)

;; Set SSH for tramp Mode
(setq tramp-default-method "ssh")

;; Set paredit Mode
(setq paredit-mode t)
