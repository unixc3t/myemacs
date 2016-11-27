
(add-hook 'clojure-mode-hook 'cider-mode)
(global-company-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
(show-paren-mode 1)
(global-set-key (kbd "C-c C-s") 'helm-do-ag)
(provide 'init-clojure)
