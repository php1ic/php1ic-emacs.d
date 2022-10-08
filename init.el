;;; init.el --- My config file

;;; Commentary:

;; Configuration file that sets up and then calls the actual config file

;;; Code:

;;; This fixed garbage collection, makes Emacs start up faster
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;; Where do the config files live
;; TODO: Check for XDG_CONFIG_HOME and use if set
(setq config_path (concat (getenv "HOME") "/.config/emacs/"))

;; Put custom settings in a separate file (which we ignore)
(setq custom-file (concat config_path "custom-settings.el"))
;; Check the custom file exists and create it if it doesn't
;; I can't get `not` to work so use this hack
(if (file-exists-p custom-file)
    ()
  (make-empty-file custom-file)
  )
(load custom-file)


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
( when (file-readable-p (concat config_path "config.org"))
  (org-babel-load-file (expand-file-name (concat config_path "config.org")))
  )

;;; Add these lines to
;;;  a) Mark the end of code I've written
;;;  b) Remove linter warning
(provide 'init)
;;; init.el ends here
