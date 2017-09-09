 ;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; open init file
(defun open-init-file()
  (interactive)
  (find-file "c:/Users/Jack/AppData/Roaming/.emacs.d/init.el"))


(require 'init-packages)
(require 'init-ui)
(require 'init-better-default)
(require 'init-org)
(require 'init-keybindings)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)

;; config swiper
(setq enable-recursive-minibuffers t)

;; config neotree
(require 'neotree)
(global-set-key (kbd "<f3>") 'neotree-toggle)
(setq neo-smart-open 1)
;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq projectile-switch-project-action 'neotree-projectile-action)

;; close auto-indent
;; (electric-indent-mode -1)

;; enter fullscreen when launch up
(setq initial-frame-alist (quote ((fullscreen . maximized))))

