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
			 all-the-icons
			 find-file-in-project
			 popwin
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

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; popwin
(require 'popwin)
(popwin-mode t)

;; enable company
(global-company-mode t)

(provide 'init-packages)
