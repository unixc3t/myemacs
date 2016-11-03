(when (>= emacs-major-version 24)
   (require 'package)
    (package-initialize)
  ;;  (add-to-list  'package-archives  '("popkit" . "http://elpa.popkit.org/packages/"))
  (setq package-archives '(("popkit". "http://elpa.popkit.org/packages/")
			   ("gnu"   . "http://elpa.zilongshanren.com/gnu/")
			   ("melpa" . "http://elpa.zilongshanren.com/melpa/")))
)


;;(setq url-gateway-method 'socks)
;;(setq socks-server '("Default server" "127.0.0.1" 1080 5))

(defvar c3t/packages '(
		       company
		       solarized-theme
		       spacemacs-theme
		       hungry-delete
		       swiper
		       counsel
		       smartparens
		       nodejs-repl
		       js2-mode
		       popwin
		       flycheck
		       web-mode
		       emmet-mode
		       js2-refactor
		       expand-region
		       iedit
		       inf-ruby
		       robe
		       ruby-compilation
		       rspec-mode
		       flymake-ruby
		       ruby-tools
		       rubocop
		       ac-inf-ruby
		       auto-complete
		       quickrun
		       helm-ag
		       flycheck
		       auto-yasnippet
		       evil
		       undo-tree
		       goto-chg
		       evil-leader
		       window-numbering
		       powerline
		       groovy-mode
		       grails-mode
		       haml-mode
		       slim-mode
		       markdown-mode
		       websocket 
		       markdown-preview-mode
		       gradle-mode
		       lua-mode
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

(require 'haml-mode)

(require 'hungry-delete)
(global-hungry-delete-mode)

(load-theme 'spacemacs-dark  t);添加主题
(set-default-font "monaco-11")
(require 'dired-x)
(setq dired-dwin-target t)

(require 'popwin)
(popwin-mode t)

(require 'gradle-mode)
(gradle-mode 1)

(require 'quickrun)
(require 'expand-region)

(require 'flycheck)
(global-flycheck-mode t)
(require 'evil)
(global-evil-leader-mode)
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(require 'powerline)
(require 'slim-mode)
(powerline-default-theme)


;;add emmet-mode-cofig
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(setq emmet-move-cursor-between-quotes t) ;; default nil



(provide 'init-packages) 
