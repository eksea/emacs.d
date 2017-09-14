(require 'cl)

(when (>= emacs-major-version 24)
  (setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
               ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(defvar eksea/packages '(
			 company
			 monokai-theme
			 go-mode
			 racket-mode
			 darkokai-theme
			 swiper
			 counsel
			 smartparens
			 neotree
			 nodejs-repl
			 js2-mode
			 find-file-in-project
			 popwin
			 helm-ag
			 web-mode
			 ) "Default packages")

(setq package-selected-packages eksea/packages)

(defun eksea/packages-installed-p ()
  (loop for pkg in eksea/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (eksea/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg eksea/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(smartparens-global-mode t)
(sp-local-pair '(emacs-lisp-mode, lisp-interaction-mode) "'" nil :actions nil)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; popwin
(require 'popwin)
(popwin-mode t)

;; config neotree
; (defun neotree-project-dir ()
;   "Open Neotree using the git root."
;   (interactive)
;   (let ((project-dir (ffip-project-root))
; 	(file-name (buffer-file-name)))
;     (if project-dir
; 	(progn
; 	  (neotree-dir project-dir)
; 	  (neotree-find file-name))
;       (message "Could not find git project root."))))
; (define-key map (kbd "C-c C-p") 'neotree-project-dir)

;; config web-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       '(("\\.htm\\'" . web-mode))
       auto-mode-alist))


;; enable company
(global-company-mode t)

;; config swiper
(setq enable-recursive-minibuffers t)

;; config neotree
(require 'neotree)
(global-set-key (kbd "<f3>") 'neotree-toggle)
(setq neo-smart-open 1)
;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq projectile-switch-project-action 'neotree-projectile-action)


(provide 'init-packages)
