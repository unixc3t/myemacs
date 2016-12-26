
(load-theme 'solarized-dark  t);添加主题
(set-default-font "文泉驿正黑-13")

(global-hl-line-mode 1)

(tool-bar-mode -1) ;去掉工具图标栏(tool-bar-mode -1)
(scroll-bar-mode -1) ;去掉屏幕右侧滚动条
(global-linum-mode t);添加行号
(setq inhibit-splash-screen t) ;关闭启动画面
(setq-default cursor-type 'bar);设置光标为竖线
(set-frame-position (selected-frame) 0 0) ;emacs打开后所处屏幕位置
(set-frame-width (selected-frame) 150) ;编辑器宽度
(set-frame-height (selected-frame) 80) ;编辑器高度

;;窗体透明
(global-set-key (kbd "<f7>") 'loop-alpha)
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))

(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
)


;;(setq initial-frame-alist (quote ((fullscreen . maximized)))) ;;全屏

(provide 'init-ui)
