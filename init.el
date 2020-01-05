;;; init.el --- My config file

;;; Commentary:

;; Configuration file that sets up and then calls the actual config file

;;; Code:

;;; This fixed garbage collection, makes Emacs start up faster
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist)
  )

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
        gc-cons-percentage 0.1)
  )

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ;("gnu" . "https://mirrors.163.com/elpa/gnu/")
			 ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         )
      )
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
( when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
  )

;;; Add these lines to
;;;  a) Mark the end of code I've written
;;;  b) Remove linter warning
(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (gitlab-ci-mode-flycheck gitlab-ci-mode irony ido-completing-read+ ido-vertical-mode flx-ido cmake-ide cmake-font-lock cmake-mode company-c-headers ccls use-package-ensure-system-package company-lsp lsp-ui lsp-mode yasnippet diminish modern-cpp-font-lock flycheck-clang-analyzer flycheck switch-window projectile which-key avy swiper magit-todos git-gutter-fringe+ magit ivy multiple-cursors expand-region rainbow-delimiters beacon htmlize org-bullets smart-mode-line solarized-theme dashboard use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
