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

;; close auto-indent
;; (electric-indent-mode -1)

;; enter fullscreen when launch up
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(setq dired-dwim-target t)

(fset 'yes-or-no-p 'y-or-n-p)

;; better config for dired mode
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
;;(put 'dired-find-alternate-file 'disable nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Hightlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(require 'dired-x)
(setq dired-dwim-target 1)

(provide 'init-better-default)
