;; -*- lexical-binding: t -*-
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(delete-selection-mode 1)
(icomplete-mode 1)
(setq-default cursor-type 'bar)
(show-paren-mode t)
(set-face-attribute 'default nil :height 160)
(setq tab-width 4)
(setq indent-tabs-mode nil)
(global-display-line-numbers-mode 1)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(prefer-coding-system 'utf-8-auto)
(global-auto-revert-mode t)
(setq ring-bell-function 'ignored)
(fset 'yes-or-no-p 'y-or-n-p)
;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(provide 'init-basic)
