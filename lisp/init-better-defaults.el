(setq ring-bell-function 'ignore) ;;关闭警告声音
(global-hl-line-mode t);开启全局行号
(window-numbering-mode 1)
(smartparens-global-mode t) ;全局使用smartparens

;片段替换
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("def" "def end ")
 					    ))

(setq make-backup-files nil);关闭备份文件
(setq auto-save-default nil);关闭自动保存
(delete-selection-mode t) 
(setq dired-dwin-target t)
(set-language-environment 'utf-8)
(global-auto-revert-mode t)
(setq ad-redefinition-action 'accept)
(require 'tabbar-ruler)
(setq tabbar-ruler-global-tabbar t)



(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))



(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;显示括号匹配
(add-hook 'web-mode-hook 'show-paren-mode) ;显示括号匹配
(add-hook 'ruby-mode-hook  'smartparens-mode) 
(add-hook 'ruby-mode-hook  'show-parens-mode) 
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'smartparens-mode)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       '(("\\.lua$\\'" . lua-mode))
       auto-mode-alist))
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil) ;lisp模式单引号不会自动补全
(global-auto-revert-mode t) ;外部修改自动加载
(global-company-mode t)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(add-hook 'js2-mode-hook
	      (lambda ()
		(setq imenu-create-index-function 'js2-imenu-make-index)))
;设置不全查找路径
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
(setq dired-recursive-copies 'always);;设置递归删除目录及其子目录
(setq dired-recursive-deletes 'always);;设置递归拷贝
(put 'dired-find-alternate-file 'disabled nil)




(provide 'init-better-defaults)
