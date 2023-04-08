;; 执行可交互函数，注意需要加个单引号
(global-set-key (kbd "<f4>") 'open-emacs-config-file) 

;; 打开最近使用的文件
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "\C-x\ \C-r") 'recentf-open-files)

;; 查找函数、变量、快捷键的定义
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(provide 'init-keybindings)
