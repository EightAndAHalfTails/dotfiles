(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;disable backup
(setq backup-inhibited t)
;disable auto save
;(setq auto-save-default nil)
;disable tabs
(setq-default indent-tabs-mode nil)
;set indent widths
(setq-default vhdl-basic-offset 4)
(setq-default c-basic-offset 4)

;;enable line numbers
(global-linum-mode 1)

;; open .h files in c++-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; open .vhc[.i] files in vhdl-mode
(add-to-list 'auto-mode-alist '("\\.vhc\\'" . vhdl-mode))
(add-to-list 'auto-mode-alist '("\\.vhc.i\\'" . vhdl-mode))

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; open tasks.org
(find-file-other-window "w:/tasks.org")
