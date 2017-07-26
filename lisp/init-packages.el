
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
			 web-mode
			 js2-refactor
			 expand-region
			 iedit
			 helm-ag
			 flycheck
			 
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

;; 配置文件

(global-hungry-delete-mode)

(smartparens-global-mode t)
;; 取消Lisp模式的单引号配对
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; expand-region config

(global-set-key (kbd "C-=") 'er/expand-region)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; js2-mode for js files config
;; html file open mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;; webmod config
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; change web indent 2 to 4
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

;; company config
(global-company-mode t)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; JavaScript Run
(require 'nodejs-repl)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
;; 激活语法检测flycheck
(global-flycheck-mode t)

;; 加载主题
(load-theme 'monokai t)

;; start Popwin
(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
