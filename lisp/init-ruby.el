;;init-ruby config
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook #'rubocop-mode)
(add-hook 'dired-mode-hook 'rspec-dired-mode)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(require 'rubocop)
(require 'ruby-tools)
(require 'auto-complete-config)
(ac-config-default)

(require 'ac-inf-ruby) ;; when not installed via package.el
    (eval-after-load 'auto-complete
      '(add-to-list 'ac-modes 'inf-ruby-mode))
    (add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)

(provide 'init-ruby)
