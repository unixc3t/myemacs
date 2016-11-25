(when (>= emacs-major-version 24)
  ;;  (add-to-list  'package-archives  '("popkit" . "http://elpa.popkit.org/packages/"))
  (setq package-archives '(("popkit". "http://elpa.popkit.org/packages/")
			   ("gnu"   . "http://elpa.zilongshanren.com/gnu/")
			   ("melpa" . "http://elpa.zilongshanren.com/melpa/")))
)


;;(setq url-gateway-method 'socks)
;;(setq socks-server '("Default server" "127.0.0.1" 1080 5))

(defvar c3t/packages '(
		       helm
		       rainbow-mode
		       magit
		       company
		       lua-mode
		       company-lua
		       nginx-mode
		       solarized-theme
		       spacemacs-theme
		       hungry-delete
		       swiper
		       counsel
		       exec-path-from-shell
		       smartparens
		       nodejs-repl
		       tabbar
		       js2-mode
		       popwin
		       flycheck
		       web-mode
		       emmet-mode
		       js2-refactor
		       expand-region
		       iedit
		       company-c-headers
		       google-c-style
		       inf-ruby
		       company-inf-ruby
		       ruby-refactor
		       robe
		       ruby-compilation
		       rspec-mode
		       flymake-ruby
		       ruby-tools
		       rubocop
		       ac-inf-ruby
		       yari
		       ruby-block
		       ruby-end
		      ;enh-ruby-mode
		       auto-complete
		       quickrun
		       helm-ag
		       flycheck
		       auto-yasnippet
		       evil
		       undo-tree
		       goto-chg
		       evil-leader
		       tabbar-ruler
		       window-numbering
		       powerline
		       groovy-mode
		       grails-mode
		       haml-mode
		       slim-mode
		       markdown-mode
		       websocket 
		       markdown-preview-eww
		       markdown-preview-mode
		       helm-ag
		       gradle-mode
		       lua-mode
		       multi-term
		       slim-mode
		       sass-mode
		       web-beautify
		       simple-httpd
		       json-mode
		       livid-mode
		       scss-mode
		       impatient-mode
		       neotree
		       feature-mode
		       ztree
		       highlight-indentation
		       ace-jump-mode
		       ) "Default packages")

(require 'cl)

(setq package-selected-packages c3t/packages)
(defun c3t/packages-installed-p ()
  (loop for pkg in c3t/packages
	when(not (package-installed-p pkg)) do (return nil)
	finally(return t)))

(unless (c3t/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg c3t/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg)))) 

(require 'company)
(require 'company-lua)
(require 'lua-mode)
(add-to-list 'company-backends 'company-lua)
 (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
    (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
    (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(require 'haml-mode)
(require 'nginx-mode)
 (require 'helm)
(require 'simple-httpd)
(require 'web-beautify)
(require 'sass-mode)
(require 'scss-mode)
(require 'ruby-refactor)
(require 'enh-ruby-mode)
(require 'hungry-delete)
(require 'livid-mode)
(require 'impatient-mode)
(global-hungry-delete-mode)
(require 'neotree)


(add-to-list 'load-path "~/.emacs.d/elpa/ace-jump-mode-20140616.1615/")
(require 'dired-x)
(require 'dired)
(require 'recentf)  ;引入 recentf这个文件功能
(recentf-mode 1)  ; 1 或者 t表示开启模式
(setq-default recentf-max-menu-items 35)  ;设置最大的最近文件打开记录

(require 'popwin)
(popwin-mode t)
(require 'slim-mode)
(require 'gradle-mode)
(gradle-mode 1)
(require 'iedit)
(require 'quickrun)
(require 'expand-region)

(require 'flycheck)
(global-flycheck-mode t)
(require 'evil)
(global-evil-leader-mode)
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(global-evil-leader-mode)
(require 'powerline)
(require 'slim-mode)
(powerline-default-theme)
(ac-config-default)

;;add emmet-mode-cofig
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'scss-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes

(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)
(setq emmet-move-cursor-between-quotes t) ;; default nil

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

 (require 'multi-term)
 (setq multi-term-program "/bin/zsh")
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)


(provide 'init-packages) 
