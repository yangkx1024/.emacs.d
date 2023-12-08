;; -*- lexical-binding: t -*-
(global-set-key (kbd "C-x b") 'consult-buffer)

(define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export-write)

(global-set-key (kbd "<f2>") 'open-init-file)

(global-set-key (kbd "<f3>") 'open-init-dir)

(provide 'init-keybindings)
