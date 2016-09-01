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

(set-language-environment "UTF-8")


;;(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  ;;"Highlight enclosing parens."
;;  (cond ((looking-at-p "\\s(") (funcall fn))
;;	(t (save-excursion
;;	     (ignore-errors (backward-up-list))
;;	     (funcall fn)))))

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;显示括号匹配

(add-hook 'js-mode-hook  'smartparens-mode) 
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
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


(require 'dired-x)
(setq dired-dwin-target t)

(provide 'init-better-defaults)
