;;init-ruby config
(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)
(add-hook 'ruby-mode-hook #'rubocop-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)
(add-hook 'dired-mode-hook 'rspec-dired-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(require 'rubocop)
(require 'ruby-tools)


(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20160827.649")
(require 'auto-complete-config)
 (add-to-list 'ac-dictionary-directories
	      "~/.emacs.d/elpa/auto-complete-20160827.649/dict")
(ac-config-default)
 (setq ac-ignore-case nil)
 (add-to-list 'ac-modes 'enh-ruby-mode)
 (add-to-list 'ac-modes 'web-mode)

(require 'ac-inf-ruby) ;; when not installed via package.el
    (eval-after-load 'auto-complete
      '(add-to-list 'ac-modes 'inf-ruby-mode))
    (add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)


(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . ruby-mode))
(provide 'init-ruby)
