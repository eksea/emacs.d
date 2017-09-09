(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; bind open-init-file to <f2>
(global-set-key (kbd "<f2>") 'open-init-file)

;; bind shortcut for recentf
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(provide 'init-keybindings)
