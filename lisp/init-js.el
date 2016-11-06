;;javascript config

(setq flycheck-javascript-eslint-executable   "~/.nvm/versions/node/v6.4.0/bin/eslint")
(setq flycheck-javascript-standard-executable "~/.nvm/versions/node/v6.4.0/bin/standard")
(setq flycheck-eslintrc "~/.emacs.d/js/eslintrc")
(add-hook 'js2-mode-hook 'flycheck-mode)
;;config for js2-refactor-mode
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")
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


(add-hook 'js-mode-hook  'show-paren-mode) 
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(add-hook 'js-mode-hook  'smartparens-mode) ;显示对应的括号匹配
    (eval-after-load 'js2-mode
       '(add-hook 'js2-mode-hook
                  (lambda ()
                    (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

     (eval-after-load 'json-mode
       '(add-hook 'json-mode-hook
                  (lambda ()
                    (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

     (eval-after-load 'sgml-mode
       '(add-hook 'html-mode-hook
                  (lambda ()
                    (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

     (eval-after-load 'css-mode
       '(add-hook 'css-mode-hook
                  (lambda ()
                    (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))




(provide 'init-js)
