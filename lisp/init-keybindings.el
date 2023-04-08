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

;; 查找 git 范围内文件
;; C-c 用户自定义快捷键，p project，f file
(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(provide 'init-keybindings)
