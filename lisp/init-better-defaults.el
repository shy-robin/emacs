;; 禁止生成备份文件（以 ~ 结尾的文件）
(setq make-backup-files nil)

;; 禁止自动生成 auto-save 文件
(setq auto-save-default nil)

;; 将用户通过图形界面生成的配置保存到 custom.el 文件中
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory)
      )
;; 当 custom.el 文件存在时，加载它
(when
    (file-exists-p custom-file)
  (load-file custom-file)
  )

;; 选择文本后输入直接替换文本，而不是添加文本
(delete-selection-mode t)

;; 关闭警告声音
(setq ring-bell-function 'ignore)

(provide 'init-better-defaults)