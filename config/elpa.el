;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                       ;;
;; Install ELPA Packages ;;
;;                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Initialize all the ELPA packages
(package-initialize)

