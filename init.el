;; 使用清华镜像源，增加可安装包的数量
(setq package-archives
  '(
    ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
    ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
    ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
  )
)

;; 安装扩展前，刷新软件源的索引
(setq package-check-signature nil) ;; 个别时候会出现签名校验失败，因此关闭签名校验
(require 'package)
;; 如果没有初始化，则初始化包管理器
(unless
  (bound-and-true-p package--initialized) 
  (package-initialize)
)
;; 如果没有刷新，则刷新软件源索引
(unless
  package-archive-contents
  (package-refresh-contents)
)
;; 如果没有安装包管理器，则刷新软件源并安装包管理器
(unless
  (package-installed-p 'use-package) 
  (package-refresh-contents) 
  (package-install 'use-package)
)

;; 导入 use-package
(require 'use-package)

;; 安装扩展的配置
(eval-and-compile
  (setq use-package-always-ensure t) ;; 默认确保每个包都已安装，避免每个包都手动添加 :ensure t 配置
  (setq use-package-always-defer t) ;; 默认每个包都是延迟加载，避免每个包都手动添加 :defer t 配置
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally t)
  (setq use-package-verbose t)
)


(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (electric-indent-mode -1) ; 取消单分号支持回车缩进，推荐开启，注释用双分号代替

;; 显示行数，使用 global 对所有 buffer 生效
(global-linum-mode t)

;; 可交互函数，可使用 M-x 调用
(defun open-emacs-config-file () (interactive) (find-file "~/.config/emacs/init.el"))

;; 执行可交互函数，注意需要加个单引号
(global-set-key (kbd "<f4>") 'open-emacs-config-file) 

;; 禁止生成备份文件（以 ~ 结尾的文件）
(setq make-backup-files nil)
;; 禁止自动生成 auto-save 文件
(setq auto-save-default nil)

;; 选择文本后输入直接替换文本，而不是添加文本
(delete-selection-mode t)

;; 启动后自动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 打开最近使用的文件
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "\C-x\ \C-r") 'recentf-open-files)

;; 高亮当前行
(global-hl-line-mode t)

;; 安装主题
(use-package monokai-theme)
(load-theme 'monokai t)

;; 将用户通过图形界面生成的配置保存到 custom.el 文件中
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory)
      )
;; 当 custom.el 文件存在时，加载它
(when
    (file-exists-p custom-file)
  (load-file custom-file)
  )

;; 批量删除空格
(use-package hungry-delete)
(global-hungry-delete-mode t)

(use-package swiper)
(use-package counsel)

(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; 自动添加括号
(use-package smartparens)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; 自动补全
(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

;; javascript
(use-package js2-mode)
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; nodejs
(use-package nodejs-repl)

;; 查找函数、变量、快捷键的定义
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
