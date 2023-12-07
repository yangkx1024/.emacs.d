;; -*- lexical-binding: t -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package restart-emacs)

(use-package company
  :init
  (global-company-mode t)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay
	(lambda () (if (company-in-string-or-comment) nil 0))))

(use-package vertico
  :init
  (vertico-mode t))

(use-package orderless
  :config
  (setq completion-styles '(orderless)))

(use-package marginalia
  :init
  (marginalia-mode t))

(use-package embark
  :bind (("C-;" . 'embark-act))
  :config
  (setq prefix-help-command 'embark-prefix-help-command))

(use-package consult
  :bind (("C-s" . 'consult-line)
	 ("M-s i" . 'consult-imenu)))

(use-package embark-consult)
(use-package wgrep
  :config
  (setq wgrep-auto-save-buffer t))

(eval-after-load 'consult
  '(eval-after-load
       'embark
     '(progn
	(require 'embark-consult)
	(add-hook
	 'embark-collect-mode-hook
	 #'consult-preview-at-point-mode))))

(defun embark-export-write()
  "Export the current vertico results to a writable buffer if possible.
Supports exporting consult-grep to wgrep, file to wdeired, and consult-location to occur-edit"
  (interactive)
  (require 'embark)
  (require 'wgrep)
  (pcase-let ((`(,type . ,candidates)
               (run-hook-with-args-until-success 'embark-candidate-collectors)))
    (pcase type
      ('consult-grep (let ((embark-after-export-hook #'wgrep-change-to-wgrep-mode))
                       (embark-export)))
      ('file (let ((embark-after-export-hook #'wdired-change-to-wdired-mode))
               (embark-export)))
      ('consult-location (let ((embark-after-export-hook #'occur-edit-mode))
                           (embark-export)))
      (x (user-error "embark category %S doesn't support writable export" x)))))
(define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export-write)

(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(provide 'init-packages)
