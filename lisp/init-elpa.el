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

(provide 'init-elpa)
