 (add-to-list 'company-backends 'company-c-headers)
  (add-hook 'c-mode-common-hook 'google-set-c-style)

(provide 'init-c)
