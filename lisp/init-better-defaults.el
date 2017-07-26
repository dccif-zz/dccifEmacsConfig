;; 取消移动提醒声
(setq ring-bell-function 'ignore)

;; 关闭自动备份
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 打开最近文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; yes or no change
(fset 'yes-or-no-p 'y-or-n-p)

(global-auto-revert-mode 1)

;; 启动选择删除x
(delete-selection-mode t)

;; 代码缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; Hippie 补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
(global-set-key [C-tab] 'hippie-expand)


;; 文件浏览优化
;; 递归复制或删除文件
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 取消文件浏览时生成新缓存
(put 'dired-find-alternate-file 'disabled nil)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; C-x C-j 打开当前文件文件夹
(require 'dired-x)
;; 多窗口文件直接复制
(setq dired-dwim-target t)

					; Windows explorer to go to the file in the current buffer
(defun open-folder-in-explorer ()  
  "Call when editing a file in a buffer. Open windows explorer in the current directory and select the current file"  
  (interactive)  
  (w32-shell-execute 
    "open" "explorer"  
    (concat "/e,/select," (convert-standard-filename buffer-file-name))
  )
)


(provide 'init-better-defaults)
