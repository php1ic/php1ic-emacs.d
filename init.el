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
  (setq gc-cons-threshold 100000000
        gc-cons-percentage 0.1)
  )

(setq read-process-output-max (* 1024 1024)) ;; 1mb

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(
                         ("gnu" . "https://elpa.gnu.org/packages/")
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
    (cmake-font-lock cmake-mode format-all modern-cpp-font-lock all-the-icons all-the-icons-dired async beacon bind-key ccls company dash dash-functional dashboard epl expand-region f flx flycheck fringe-helper git-commit git-gutter+ gitlab-ci-mode gitlab-ci-mode-flycheck ht htmlize ido-completing-read+ ido-vertical-mode ivy lv markdown-mode memoize multiple-cursors org-bullets page-break-lines pkg-info projectile rainbow-delimiters rich-minority s solarized-theme spinner transient with-editor yaml-mode yasnippet flx-ido diminish switch-window which-key avy swiper git-gutter-fringe+ magit smart-mode-line company-lsp lsp-ui lsp-mode use-package)))
 '(safe-local-variable-values (quote ((magit-todos-exclude-globs "external/*")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
