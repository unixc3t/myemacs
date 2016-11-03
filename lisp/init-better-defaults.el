(setq ring-bell-function 'ignore) ;;关闭警告声音
(global-hl-line-mode t);开启全局行号
(window-numbering-mode 1)
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("xxx" "def xxx")
					    ))
(require 'recentf)  ;引入 recentf这个文件功能
(recentf-mode 1)  ; 1 或者 t表示开启模式
(setq-default recentf-max-menu-items 35)  ;设置最大的最近文件打开记录

(setq make-backup-files nil);关闭备份文件
(setq auto-save-default nil);关闭自动保存
(delete-selection-mode t) 

(set-language-environment 'utf-8)
(global-auto-revert-mode t)





(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;显示括号匹配
(add-hook 'js-mode-hook  'smartparens-mode) 
(add-hook 'ruby-mode-hook  'smartparens-mode) 
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'smartparens-mode)


(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       '(("\\.lua$\\'" . lua-mode))
       auto-mode-alist))






(smartparens-global-mode t) ;全局使用smartparens
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil) ;lisp模式单引号不会自动补全
(global-auto-revert-mode t) ;外部修改自动加载
(global-company-mode t)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol
					 ))

(fset 'yes-or-no-p 'y-or-n-p)
;;设置递归删除目录及其子目录
;;设置递归拷贝
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(put 'dired-find-alternate-file 'disabled nil)

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))




(provide 'init-better-defaults)
