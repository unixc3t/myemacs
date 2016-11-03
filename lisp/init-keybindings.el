(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h C-f") 'counsel-describe-function)
(global-set-key (kbd "C-h C-v") 'counsel-describe-variable)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "<f5>") 'open-my-init-file);定义打开配置文件快捷键
(global-set-key (kbd "<f9>") 'quickrun)
;;(global-set-key "C-x C-r" 'recentf-open-files) ; 定义快捷键 打开文件打开记录列表
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)


;;(global-set-key (kbd "C-h C-f") 'find-function)
;;(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "<f3>") 'eval-buffer);设置执行整个缓冲区快捷键
(global-set-key (kbd "C-c p f") 'counsel-git)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key (kbd "s-/") 'hippie-expand)
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent) ;;切换缩进
(global-set-key (kbd "M-s o") 'occur-dwim)

(global-set-key (kbd "M-s i") 'counsel-imenu)
(global-set-key (kbd "M-s e") 'iedit-mode)
(global-set-key (kbd "C-=") 'er/expand-region)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(with-eval-after-load 'auto-complete
(define-key ac-complete-mode-map (kbd "M-n") nil)
  (define-key ac-complete-mode-map (kbd "M-p") nil)
(define-key ac-complete-mode-map (kbd "M-n") #'company-select-next)
  (define-key ac-complete-mode-map (kbd "M-p") #'company-select-previous)
  )


(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)
(global-set-key (kbd "C-w") 'backward-kill-word)

(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  "5" 'select-window-5
  "6" 'select-window-6
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wm" 'delete-other-windows
  )

(provide 'init-keybindings)
