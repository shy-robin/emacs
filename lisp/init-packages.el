;; 安装主题
(use-package monokai-theme)
(load-theme 'monokai t)

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
;; 在 emacs-lisp-mode 下输入单引号不自动添加
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; 自动补全
(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

;; javascript
(use-package js2-mode)
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
         ("\\.html\\'" .web-mode))
       auto-mode-alist))

;; nodejs
(use-package nodejs-repl)

;; macOS 下快速在 finder 下打开文件
(use-package reveal-in-osx-finder)

(use-package web-mode)

(defun my-web-mode-indent-setup()
  ;; 设置 html、css、js 的缩进大小
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; 切换缩进
(defun my-web-mode-toggle-indent()
  (interactive)
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
    (progn (setq js-indent-level (if (= js-indent-level 2) 4 2))
           (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))
    )
  )
  (if (eq major-mode 'web-mode)
    (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
           (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
           (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))
    )
  )
  (if (eq major-mode 'css-mode) (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  (setq indent-tabs-mode nil)
)

(provide 'init-packages)
