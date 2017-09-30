(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; bind open-init-file to <f2>
(global-set-key (kbd "<f2>") 'open-init-file)

;; bind open-home to <f4>
(global-set-key (kbd "<f4>") 'open-home)

;; bind shortcut for recentf
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(global-set-key (kbd "M-s i") 'counsel-imenu)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "<f5>") 'geiser-mode-switch-to-repl-and-enter)

(global-set-key (kbd "C-,") 'ggtags-find-tag-dwim)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(provide 'init-keybindings)
