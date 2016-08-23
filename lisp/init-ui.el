(tool-bar-mode -1) ;去掉工具图标栏(tool-bar-mode -1)
(scroll-bar-mode -1) ;去掉屏幕右侧滚动条
(global-linum-mode t);添加行号
(setq inhibit-splash-screen t) ;关闭启动画面
(setq-default cursor-type 'bar);设置光标为竖线
(set-frame-position (selected-frame) 0 0) ;emacs打开后所处屏幕位置
(set-frame-width (selected-frame) 180) ;编辑器宽度
(set-frame-height (selected-frame) 80) ;编辑器高度

;;(setq initial-frame-alist (quote ((fullscreen . maximized)))) ;;全屏

(provide 'init-ui)
