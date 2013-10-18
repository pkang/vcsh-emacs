(require 'package)
(require 'ido)

(package-initialize)

(setq inhibit-splash-screen t)
(setq undo-outer-limit 63292340)

(global-set-key "\C-co" 'compile)
(global-set-key "\C-cl" 'grep)
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cs" 'shell)
(global-set-key "\C-cb" 'browse-url)
(global-set-key "\C-cj" 'goto-line)
(global-set-key "\C-z" 'shell)
;; (global-set-key "\C-c\C-b" 'ibuffer)

(setq-default mode-line-format '(
				 "%e"
				 gs:hostname "/" user-login-name " "
				 #("-" 0 1
				   (help-echo "mouse-1: select (drag to resize), mouse-2 = C-x 1, mouse-3 = C-x 0"))
				 mode-line-mule-info mode-line-modified mode-line-frame-identification mode-line-buffer-identification
				 #("   " 0 3
				   (help-echo "mouse-1: select (drag to resize), mouse-2 = C-x 1, mouse-3 = C-x 0"))
				 mode-line-position
				 (vc-mode vc-mode)
				 #("  " 0 2
				   (help-echo "mouse-1: select (drag to resize), mouse-2 = C-x 1, mouse-3 = C-x 0"))
				 mode-line-modes
				 (which-func-mode
				  ("" which-func-format
				   #("--" 0 2
				     (help-echo "mouse-1: select (drag to resize), mouse-2 = C-x 1, mouse-3 = C-x 0"))))
				 (global-mode-string
				  (#("--" 0 2
				     (help-echo "mouse-1: select (drag to resize), mouse-2 = C-x 1, mouse-3 = C-x 0"))
				   global-mode-string))
				 #("-%-" 0 3
				   (help-echo "mouse-1: select (drag to resize), mouse-2 = C-x 1, mouse-3 = C-x 0"))))

(when (fboundp 'ibuffer)
      (defalias 'list-buffers 'ibuffer))

(add-hook 'shell-mode-hook 
	  '(lambda ()
	     (global-set-key (kbd "s-p") 'comint-previous-input)
	     (define-key shell-mode-map "\M-r" 
	       'comint-previous-matching-input-from-input)))

(defvar auto-save-dir "~/var/emacs-saves/")
(setq gs:backups-dir "~/var/emacs-backups/")
(make-directory auto-save-dir t)
(make-directory gs:backups-dir t)
(setq backup-directory-alist (list (cons "." gs:backups-dir)))

; Display time and date.
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;; Display column number.
(column-number-mode 1)

;; Frame visuals
;(set-default-font "-apple-Monaco-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
(setq default-frame-alist '(
      (background-color . "Black")
      (foreground-color . "light goldenrod yellow")
      (tool-bar-lines . 0)
))


;;------------------------------------------------------------
;; Markdown
;;------------------------------------------------------------
;(require 'markdown-mode)
;(setq auto-mode-alist
;     (append
;      '(
;        ( "\\.md$"  . markdown-mode )
;        )
;      auto-mode-alist))
