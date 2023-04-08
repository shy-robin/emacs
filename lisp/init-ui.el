(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (electric-indent-mode -1) ; 取消单分号支持回车缩进，推荐开启，注释用双分号代替

;; 显示行数，使用 global 对所有 buffer 生效
(global-linum-mode t)

;; 启动后自动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 高亮当前行
(global-hl-line-mode t)

(provide 'init-ui)
