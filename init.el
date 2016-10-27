(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defvar udit/packages
  '(;; haskell mode 
    haskell-mode
    
    ;; silver searcher
    ag

    ;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit


    ;; Autocompletion
    company

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider
    ac-cider
    ;; cider-eval-sexp-fu
    clj-refactor

    ;; Basic interaction with a Clojure subprocess
    ;; Conflicts with CIDER C-c C-z
    ;; inf-clojure

    ;; formatting of let-like forms
    ;; align-cljlet

    ;; Syntax checking
    flycheck
    flycheck-clojure
    flycheck-pos-tip

    ;; Semantic region expansion
    expand-region

    ;; HAML syntax highlighting and indentation
    haml-mode

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Allow to go to Java class source.
    ;; javap

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; symbol search
    smartscan

    ;; Searching project files.
    ivy
    swiper
    fiplr

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; highlight word under point
    highlight-symbol

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ;; better interface for grep
    wgrep

    ;; clipboard integration
    ;; clipmon
     
    ;; Go to last change
    goto-last-change

    ;; Undo Tree
    undo-tree

    ;; Markdown
    markdown-mode

    ;; Dash at point
    dash-at-point

    ;; Org mode
    org))

(dolist (pkg udit/packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'show-paren-mode)

(setq cider-repl-display-help-banner nil)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'show-paren-mode)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
(eval-after-load 'cider-mode
                     '(define-key text-mode-map (kbd "s-d") 'cider-doc-map))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)

(toggle-frame-fullscreen)
(toggle-tool-bar-mode-from-frame)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(global-company-mode)
(projectile-mode)
(global-set-key (kbd "s-t") 'fiplr-find-file)

;; Replace return key with newline-and-indent when in cider mode.
(add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

; Syntax Highlighting
(require 'highlight-symbol)
(global-set-key (kbd "C-.") 'highlight-symbol-at-point)
(global-set-key (kbd "s-r") 'ag)

;; Indendation configs as per -
;; https://github.com/weavejester/compojure/wiki/Emacs-indentation
(require 'clojure-mode)

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))
(put 'upcase-region 'disabled nil)

;; Initiate linum mode always
(global-linum-mode 1)

;; Set keys to navigate panes
(global-set-key (kbd "<S-up>") 'windmove-up)
(global-set-key (kbd "<S-down>") 'windmove-down)
(global-set-key (kbd "<S-left>") 'windmove-left)
(global-set-key (kbd "<S-right>") 'windmove-right)

;; Settings for ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; Settings for fiplr
(setq fiplr-root-markers '(".git" ".svn"))
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))

;; Settings for Dash
(global-set-key (kbd "s-.") 'dash-at-point)

;; Settings for autocomplete cider (ac-cider)
(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))
