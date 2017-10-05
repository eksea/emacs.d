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
			 spaceline
			 all-the-icons
			 neotree
			 nodejs-repl
			 js2-mode
			 cmake-mode
			 popwin
			 ;; powerline
			 helm-ag
			 web-mode
			 json-mode
			 expand-region
			 exec-path-from-shell
			 evil
			 evil-leader
			 evil-surround
			 evil-nerd-commenter
			 window-numbering
			 geiser
			 ggtags
			 which-key
			 fzf
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

;; (require 'powerline)
;; (powerline-default-theme)

(window-numbering-mode 1)

(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

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
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq projectile-switch-project-action 'neotree-projectile-action)

(evil-mode 1)
;; using emacs keybindings in evil-insert-state
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(which-key-mode 1)

;; add/delete/change surround for content
(require 'evil-surround)
(global-evil-surround-mode)

;; Emacs key bindings for commenter
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

;; config ggtags
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	      (ggtags-mode 1))))
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'find-file
  "fj" 'counsel-file-jump
  "ss" 'swiper
  "cg" 'counsel-git
  "ci" 'evilnc-comment-or-uncomment-lines
  "fr" 'recentf-open-files
  "sf" 'switch-to-buffer
  "kf" 'kill-buffer
  "sg" 'helm-do-ag-project-root
  "sd" 'helm-do-ag
  "sb" 'helm-ag-buffers
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  "wh" 'split-window-right
  "wv" 'split-window-below
  "wm" 'delete-other-windows
  "gt" 'ggtags-find-tag-dwim
  "gr" 'ggtags-find-reference
  "gf" 'ggtags-find-file
  "i" 'imenu
  ":" 'counsel-M-x)

(provide 'init-packages)
