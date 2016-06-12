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
   async   
   helm
   helm-cmd-t
   helm-projectile
   

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
