;;; init.el -- My Emacs configuration
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; I have nothing substantial to say here.
;;
;;; Code:

(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(add-to-list 'exec-path "/usr/local/bin")


;; Essential settings.
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(if window-system
      (tool-bar-mode -1)
      (menu-bar-mode -1))
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(global-visual-line-mode 0)
(setq-default left-fringe-width nil)
(setq-default indent-tabs-mode nil)
(eval-after-load "vc" '(setq vc-handled-backends nil))
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(setq visible-bell t)

;;; El Capitan visual bell fix
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

(global-visual-line-mode 0)
(set-default 'truncate-lines t)

;; Smoother scrolling
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq scroll-step           1
        scroll-conservatively 10000)

(put 'narrow-to-region 'disabled nil)

(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)

;;; File type overrides.
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))

(require 'rainbow-mode)
(require 'cl-lib)
(require 'projectile)
(require 'project-root)
(require 'helm)
(require 'helm-projectile)
(require 'helm-elscreen)
(require 'helm-utils)
(require 'helm-plugin)

(require 'project-root)
(require 'init-utils)
(require 'init-platform)
(require 'init-global-functions)
(require 'init-elpa)

(maybe-require-package 'use-package)
(eval-when-compile
  (require 'use-package))

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(defun completion-accept-or-cycle (&optional n)
  "Accept current completion if there's only one possible candidate.
Otherwise, cycle the completion candidates. A numerical prefix argument
N specifies the number of candidates to cycle forwards (or backwards if
N is negative)."
  (interactive)
  (let ((overlay (completion-ui-overlay-at-point)))
    (when overlay 
      (if (= (length (overlay-get overlay 'completions)) 1)
      (completion-accept)
      (completion-cycle n)))))



(require 'diminish)
(require 'bind-key)
(require 'init-org)
(require 'init-fonts)
(require 'init-gtags)
(require 'init-evil)
(require 'init-twitter)
(require 'init-maps)
(require 'init-w3m)
(require 'init-powerline)
;(require 'auto-complete)
;(require 'anything-c-javadoc)
(require 'init-flycheck)

;;(define-key completion-overlay-map "\t" 'completion-accept-or-cycle)


(evil-set-initial-state 'dired-mode 'normal)
(evil-set-initial-state 'wdired-mode 'normal)


; (use-package color-theme-sanityinc-tomorrow :ensure t :init (load-theme 'sanityinc-tomorrow-bright t))
;(use-package noctilux-theme :ensure t  :init  (load-theme 'noctilux t))
                                        ;(use-package grandshell-theme :ensure t :init (load-theme 'grandshell t))
                                        ;(custom-set-faces `(default ((t (:background "000000")))))
(load-theme 'noctilux-xterm16 t)

(provide 'emacs)
;;; emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((no-byte-compile t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
