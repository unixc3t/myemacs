(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")   t)
  )

(require 'cl)
(setq url-gateway-method 'socks)
(setq socks-server '("Default server" "127.0.0.1" 1080 5))

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
		       ) "Default packages")

(setq package-selected-packages c3t/packages)

(global-flycheck-mode t)
(global-auto-revert-mode t)
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



(require 'hungry-delete)
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
(load-theme 'spacemacs-dark  t);添加主题
(require 'popwin)
(popwin-mode t)

(provide 'init-packages) 
