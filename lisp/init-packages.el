;; 设置初始文件夹
(setq default-directory "~/")

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(require 'cl)

(defvar dccif/packages '(
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

(setq package-selected-packages dccif/packages)

(defun dccif/packages-installed-p ()
  (loop for pkg in dccif/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (dccif/packages-installed-p)
  (message "%s" "Refreshing package databaes...")
  (package-refresh-contents)
  (dolist (pkg dccif/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))



(global-hungry-delete-mode)

(smartparens-global-mode t)
;; 取消Lisp模式的单引号配对
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; js2-mode for js files config
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


(global-company-mode t)

;; JavaScript Run
(require 'nodejs-repl)

;; 加载主题
(load-theme 'monokai t)

;; start Popwin
(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
