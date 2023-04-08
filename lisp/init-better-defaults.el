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

;; 缩进整个 buffer
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

;; 如果选中了文本则缩进选中的文本，否则缩进整个 buffer
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p) (progn (indent-region (region-beginning) (region-end))
				 (message "Indented selected region!"))
      (progn (indent-buffer) (message "Indented buffer!"))))
  )

;; 补全的优先级
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

;; 修改确认提示
(fset 'yes-or-no-p 'y-or-n-p)

;; 默认递归删除或拷贝目录（在 dired 模式下）
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 多个 dired 模式共用一个 buffer
(put 'dired-find-alternate-file 'disabled nil)
(require 'dired)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 使用 C-x C-j 快速进入 dired 模式
(require 'dired-x)

;; 支持不同分屏下 dired 模式互传文件
(setq dired-dwim-target t)

(provide 'init-better-defaults)
