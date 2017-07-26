;; 设置初始文件夹
(setq default-directory "~/")

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
		      popwin
		      
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


(global-hungry-delete-mode)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; js2-mode for js files config
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)

;; 加载主题
(load-theme 'monokai t)

;; start Popwin
(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
