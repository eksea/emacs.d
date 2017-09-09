;; close tool bar
(tool-bar-mode -1)

;; close scroll bar
(scroll-bar-mode -1)

;; show line number
(global-linum-mode 1)

;; close splash screen
(setq inhibit-splash-screen 1)

;; customize cursor style
(setq-default cursor-type 'bar)

(global-hl-line-mode t)

;; customize font-size
(set-face-attribute 'default nil :height 200)

;; customize font-family
(set-default-font "Anonymous Pro")

;;(load-theme 'monokai t)
(load-theme 'darkokai t)

(provide 'init-ui)
