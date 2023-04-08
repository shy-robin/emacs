(add-to-list
  'load-path
  (expand-file-name (concat user-emacs-directory "lisp"))
)

;; 可交互函数，可使用 M-x 调用
(defun open-emacs-config-file () (interactive) (find-file "~/.config/emacs/init.el"))

(require 'init-elpa)
(require 'init-packages)
(require 'init-keybindings)
(require 'init-ui)
(require 'init-better-defaults)
