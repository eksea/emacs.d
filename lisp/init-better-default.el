
(setq ring-bell-function 'ignore)

;; open recently edited files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 26)

(setq auto-save-default nil)
(setq make-backup-files nil)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; delete selected content while input
(delete-selection-mode t)

(setq dired-dwim-target t)

(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-better-default)
