(add-to-list 'load-path "~/.emacs.d/lisp/")
(defun open-my-init-file();定义打开配置文件函数
 (interactive)
 (find-file "~/.emacs.d/init.el")
 )
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)
(require 'custom)


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))




















				



















