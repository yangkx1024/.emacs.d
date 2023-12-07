;; -*- lexical-binding: t -*-
(use-package doom-themes
  :ensure t
  :config
  (doom-themes-org-config)

  (let ((theme (if (display-graphic-p)
                   'doom-one
                 'doom-Iosvkem)))
    (load-theme theme t)))

(use-package nerd-icons
  :ensure t
  :when (display-graphic-p)
  :demand t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (setq column-number-mode t)
  (setq line-number-mode t))


(provide 'init-ui)
