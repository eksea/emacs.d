(setq mouse-wheel-scroll-amount '(3 ((shift) . 3) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(setq ring-bell-function 'ignore)

;; open recently edited files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 26)

;; set tab to space
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(require 'whitespace)
(global-whitespace-mode 1)

(setq auto-save-default nil)
(setq make-backup-files nil)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(add-hook 'scheme-mode-hook 'show-paren-mode)
(add-hook 'geiser-repl-mode-hook 'show-paren-mode)

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

;; Open a temporary buffer
(setq initial-major-mode (quote text-mode))
(defun lorem-new-empty-buffer ()
  (interactive)
  (let (($buf (generate-new-buffer "untitled")))
    (switch-to-buffer $buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)
    $buf
    ))
(global-set-key (kbd "C-c n") 'lorem-new-empty-buffer)

;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;;(global-whitespace-mode t) (custom-set-variables
;; '(whitespace-display-mappings '((space-mark 32 [183] [46])
;; (space-mark 160 [164] [95]) ;; (newline-mark 10 [36 10]) (tab-mark
;; 9 [187 9] [92 9]))))

;; fix stuck when emacs show special characters
(when (eq system-type 'windows-nt)
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect))

(provide 'init-better-default)
