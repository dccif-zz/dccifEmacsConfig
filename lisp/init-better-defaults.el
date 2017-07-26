;; 取消移动提醒声
(setq ring-bell-function 'ignore)

;; 关闭自动备份
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 打开最近文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)


(global-auto-revert-mode)

;; 启动选择删除x
(delete-selection-mode t)

(provide 'init-better-defaults)
