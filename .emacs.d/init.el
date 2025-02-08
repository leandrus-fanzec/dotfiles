(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-splash-screen t)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
;; Easy-Kill de buffer whitout modifications
(global-set-key [(control x) (k)] 'kill-this-buffer)

;; Puedes incluir el nombre usuario entre las colmillas:
(setq user-full-name "Leandrus Fanzec")

;; Unfill Function
;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

(setq org-file-apps
      '(("pdf" . "evince %s")
	))


(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode))

(use-package olivetti)

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

(use-package org-modern)
(global-org-modern-mode)

;; Line numbers 
(defun my-display-numbers-hook ()
  (display-line-numbers-mode 1)
  )
(add-hook 'prog-mode-hook 'my-display-numbers-hook)

(require 'spacious-padding)

(spacious-padding-mode 1)

;; Set a key binding if you need to toggle spacious padding.
(define-key global-map (kbd "<f8>") #'spacious-padding-mode)

;; Load the theme of your choice.
(load-theme 'modus-operandi)

(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

(add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'org-mode-hook 'olivetti-mode)
(setq org-startup-indented t
      org-pretty-entities t
      org-adapt-indentation t
      org-odd-levels-only t
      org-hide-leading-stars t
      org-image-actual-width '(300))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flyspell-default-dictionary "es")
 '(package-selected-packages '(spacious-padding org-modern company orderless vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
