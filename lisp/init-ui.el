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
(set-face-attribute 'default nil :height 160)

;; customize font-family
;; (set-default-font "Anonymous Pro")
;; Setting English Font
(set-face-attribute
 'default nil :font "Anonymous Pro")
;; Setting Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "SimHei")))

;;(load-theme 'monokai t)
(load-theme 'darkokai t)

(provide 'init-ui)
