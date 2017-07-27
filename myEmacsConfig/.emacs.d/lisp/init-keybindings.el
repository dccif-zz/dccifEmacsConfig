;; 最近文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; swiper config
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key(kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)


;; 查找快捷键
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 使用AG全局搜索版本库
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; 版本仓库
(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "M-s e") 'iedit-mode)

(provide 'init-keybindings)
