;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(require 'cl)

(defvar my/packages '(
		      company
		      monokai-theme
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      org
		      js2-mode
		      nodejs-repl
		      
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package databaes...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;;修改字体
;;(dolist (charset '(kana han cjk-misc bopomofo))
  ;;(set-fontset-font (frame-parameter nil 'font) charset
		    ;;(font-spec :family "微软雅黑" :size 20)))

;; 设置初始文件夹
(setq default-directory "~/")
;; 关闭状态栏
(tool-bar-mode -1)
;; 关闭启动界面
(setq inhibit-splash-screen t)
;; 加载主题
(load-theme 'monokai t)
;; 更改光标
(setq-default cursor-type 'bar)

;; 关闭自动备份
(setq make-backup-files nil)

;; Org模式高亮
(require 'org)
(setq org-src-fontify-natively t)

;; Org Agenda使用 （安排日程）
(setq org-agenda-files '("~/org"))
;; 设置打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; 启动全局行号和标记
(global-linum-mode t)
(global-company-mode t)
(global-hl-line-mode t)

;; 打开最近文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 启动选择删除
(delete-selection-mode t)

;; hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; swiper config
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

;; smartparens config
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; js2-mode for js files config
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; JavaScript Run
(require 'nodejs-repl)
;;(pop-to-buffer (make-comint "node-repl" "node" nil "--interactive"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("9492cf1ac00c8a1f7130a867a97404dfeb6727801c6b2b40b853b91543f7af67" default)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "宋体" :foundry "outline" :slant normal :weight normal :height 139 :width normal))))
 '(js2-external-variable ((t (:foreground "dark gray")))))
