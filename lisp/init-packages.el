(when (>= emacs-major-version 24)
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

(require 'quickrun)
(global-flycheck-mode t)
(global-auto-revert-mode t)

(require 'expand-region)
(require 'hungry-delete)
(require 'flycheck)
(require 'evil)
(require 'powerline)
(powerline-default-theme)
(window-numbering-mode 1)
(global-evil-leader-mode)
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(setq flycheck-javascript-eslint-executable   "~/.nvm/versions/node/v6.4.0/bin/eslint")
(setq flycheck-javascript-standard-executable "~/.nvm/versions/node/v6.4.0/bin/standard")
(setq flycheck-eslintrc "~/.emacs.d/js/eslintrc")


(add-hook 'js2-mode-hook 'flycheck-mode)
(global-hungry-delete-mode)
;;config for js2-refactor-mode
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

(smartparens-global-mode t) ;全局使用smartparens
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;;(sp-local-pair 'emacs-lisp-mode' "'" nil :actions nil)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)





(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))



(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
;;add emmet-mode-config
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(setq emmet-move-cursor-between-quotes t) ;; default nil


(defun js2-imenu-make-index ()
      (interactive)
      (save-excursion
	;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
	(imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
				   ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	      (lambda ()
		(setq imenu-create-index-function 'js2-imenu-make-index)))





;;添加函数在4个空格缩进和2个空格缩进之间切换

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

(setq indent-tabs-mode nil))

(global-company-mode t)
(global-flycheck-mode t)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

(load-theme 'spacemacs-dark  t);添加主题
(require 'popwin)
(popwin-mode t)

(provide 'init-packages) 
