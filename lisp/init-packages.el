(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")   t)
 )

(require 'cl)


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
		       ) "Default packages")

(setq package-selected-packages c3t/packages)


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

(smartparens-global-mode t) ;全局使用smartparens

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
(global-company-mode t)
(load-theme 'spacemacs-dark  t);添加主题
(require 'popwin)
(popwin-mode t)

(provide 'init-packages) 
