(setq ring-bell-function 'ignore) ;;关闭警告声音
(global-auto-revert-mode t)
(global-hl-line-mode t);开启全局行号

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("xxx" "def xxx")
					    ))
(require 'recentf)  ;引入 recentf这个文件功能

(setq make-backup-files nil);关闭备份文件
(setq auto-save-default nil);关闭自动保存
(delete-selection-mode t) 

(recentf-mode 1)  ; 1 或者 t表示开启模式
(setq-default recentf-max-menu-items 35)  ;设置最大的最近文件打开记录
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;显示括号匹配

(add-hook 'js-mode-hook  'smartparens-mode) 
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'after-init-hook 'global-company-mode)


;;自定义缩进函数
(defun indent-buffer()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer."))

      )))



(provide 'init-better-defaults)
