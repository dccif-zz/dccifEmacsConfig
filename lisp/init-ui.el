;; 关闭状态栏
(tool-bar-mode -1)

;; 关闭启动界面
(setq inhibit-splash-screen t)

;; 更改光标
(setq-default cursor-type 'bar)

;; 启动全局行号和标记
(global-linum-mode t)
(global-company-mode t)
(global-hl-line-mode t)

(provide 'init-ui)
