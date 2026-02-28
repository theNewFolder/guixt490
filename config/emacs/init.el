;; System Crafters style Emacs configuration
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file (file-exists-p custom-file))
  (load custom-file nil :nomessage))

;; Load Crafted Emacs init
(load (expand-file-name "modules/crafted-init-config"
                        "~/.config/crafted-emacs"))

;; Package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; === Theme: Modus Vivendi Tinted ===
(use-package modus-themes
  :config
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-mixed-fonts t
        modus-themes-org-blocks 'tinted-background)
  (load-theme 'modus-vivendi-tinted t))

;; === Fonts ===
(set-face-attribute 'default nil
                    :font "JetBrains Mono"
                    :height 120
                    :weight 'regular)
(set-face-attribute 'fixed-pitch nil
                    :font "JetBrains Mono"
                    :height 120)
(set-face-attribute 'variable-pitch nil
                    :font "Cantarell"
                    :height 130
                    :weight 'regular)

;; === Completion: Vertico + Marginalia + Orderless + Corfu ===
(use-package vertico
  :init (vertico-mode))

(use-package marginalia
  :init (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  :init (global-corfu-mode))

(use-package embark
  :bind ("C-." . embark-act))

(use-package consult
  :bind (("C-s" . consult-line)
         ("C-x b" . consult-buffer)))

;; === Quality of Life ===
(use-package which-key
  :init (which-key-mode))

(use-package magit)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 28)
  (doom-modeline-bar-width 4))

;; === UI Cleanup ===
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(setq visible-bell t)
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; === Org Mode ===
(setq org-ellipsis " ▾"
      org-hide-emphasis-markers t)
