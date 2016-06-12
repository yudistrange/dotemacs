;;;;;;;;;;;;;;;;;;;;;;;;;
;;                     ;;
;; Set the color theme ;;
;;                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-laptop)

;;;;;;;;;;;;;;;;;;;;;;
;;                  ;;
;; Set default font ;;
;;                  ;;
;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-13"))

;; Disable popup boxes
(setq use-dialog-box nil)
