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
			 expand-region
			 evil
			 evil-leader
			 evil-surround
			 evil-nerd-commenter
			 window-numbering
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

(evil-mode 1)
;; using emacs keybindings in evil-insert-state
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(window-numbering-mode 1)

;; add/delete/change surround for content
(require 'evil-surround)
(global-evil-surround-mode)

;; Emacs key bindings for commenter
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

(global-evil-leader-mode)
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "ff" 'find-file
  "fr" 'recentf-open-files
  "sb" 'switch-to-buffer
  "kf" 'kill-buffer
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wm" 'delete-other-windows
  ":" 'counsel-M-x)

(provide 'init-packages)
