(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(defun open-my-init-file();定义打开配置文件函数
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

(setenv "PATH" (concat "/home/rudy/.nvm/versions/node/v7.2.1/bin" ":"
		       "/home/rudy/.rbenv/shims/rake" ":"
		       (getenv "PATH")
		       )
	)

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-ruby)
(require 'init-js)
(require 'init-cpp)
(require 'init-clojure)
(require 'init-fun)

(require 'init-keybindings)



(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))


(load-file custom-file)






































