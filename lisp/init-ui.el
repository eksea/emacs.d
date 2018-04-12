;; close tool bar
(tool-bar-mode -1)

(menu-bar-mode -1)

;; close scroll bar
(scroll-bar-mode -1)

;; show line number
(global-linum-mode 1)

;; close splash screen
(setq inhibit-splash-screen 1)

;; customize cursor style
(setq-default cursor-type 'bar)

(global-hl-line-mode t)

(defun eksea-set-font()
  (interactive)
  ;; customize font-size
  (set-face-attribute 'default nil :height 160)

  ;; customize font-family
  ;; (set-default-font "Anonymous Pro")
  ;; Setting English Font
  (set-face-attribute
   'default nil :font "Inconsolata")
  ;; Setting Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "SimHei")))
  )

(if window-system
    (eksea-set-font))


;;(load-theme 'monokai t)
;; (load-theme 'darkokai t)
;;(require 'moe-theme)
;;(moe-dark)
;;(moe-theme-set-color 'cyan)
(require 'doom-themes)
(load-theme 'doom-one t)
(doom-themes-visual-bell-config)
(doom-themes-neotree-config)
(doom-themes-org-config)

(set-face-foreground 'font-lock-comment-face "#14B696")

(provide 'init-ui)
