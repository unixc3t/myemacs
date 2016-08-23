(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h C-f") 'counsel-describe-function)
(global-set-key (kbd "C-h C-v") 'counsel-describe-variable)

(global-set-key (kbd "<f5>") 'open-my-init-file);定义打开配置文件快捷键
(global-set-key "\C-x\ \C-r" 'recentf-open-files) ; 定义快捷键 打开文件打开记录列表


(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "<f3>") 'eval-buffer);设置执行整个缓冲区快捷键
(global-set-key (kbd "C-c p f") 'counsel-git)

(provide 'init-keybindings)
