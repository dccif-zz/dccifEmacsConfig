;; Org模式高亮
(require 'org)
(setq org-src-fontify-natively t)

;; Org Agenda使用 （安排日程）
(setq org-agenda-files '("~/org"))
;; 设置打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
