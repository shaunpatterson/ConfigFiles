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

(defgroup dotemacs nil
  "Custom configuration for dotemacs."
  :group 'local)

(defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
  "The storage location for various persistent files."
  :group 'dotemacs)

(defcustom dotemacs-completion-engine
  'company
  "The completion engine the use."
  :type '(radio
          (const :tag "company-mode" company)
          (const :tag "auto-complete-mode" auto-complete))
  :group 'dotemacs)

(defcustom dotemacs-switch-engine
  'ivy
  "The primary engine to use for narrowing and navigation."
  :type '(radio
          (const :tag "helm" helm)
          (const :tag "ido" ido)
          (const :tag "ivy" ivy))
  :group 'dotemacs)

(defcustom dotemacs-pair-engine
  'emacs
  "The primary engine to use auto-pairing and parens matching."
  :type '(radio
          (const :tag "emacs" emacs)
          (const :tag "smartparens" smartparens))
  :group 'dotemacs)


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

(setq backup-directory-alist `(("." . "~/.saves")))
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
            `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
            `((".*" ,temporary-file-directory t)))


;;; File type overrides.
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))

(require 'rainbow-mode)
(require 'cl-lib)
(require 'projectile)
(require 'helm)
(require 'helm-projectile)
;;(require 'helm-elscreen)
(require 'helm-utils)
(require 'helm-plugin)

(require 'init-utils)
(require 'init-core)
(require 'init-platform)
(require 'init-global-functions)
(require 'init-elpa)
(require 'init-linum)

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
(require 'vc)
(require 'vc-git)
(require 'bind-key)
(require 'init-org)
(require 'init-fonts)
(require 'init-gtags)
;;(require 'init-elscreen)
(require 'init-evil)
(require 'init-maps)
(require 'init-w3m)
(require 'init-powerline)
(require 'auto-complete)
;,(require 'anything-c-javadoc)
(require 'init-flycheck)
(require 'init-bindings)
(require 'init-filetypes)

(load-theme 'noctilux-xterm16 t)

(setenv "PATH" (concat "~/bin" ":"
                       "/usr/local/bin" ":"
                       "~/.nvm/versions/node/v5.1.1/bin/"
                       (getenv "PATH")))

(provide 'emacs)
;;; emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#000000" "#ff3333" "#afd7af" "#aaeecc" "#aaccff" "#FF1F69" "#aadddd" "#999999"])
 '(background-color "#000000")
 '(background-mode dark)
 '(cursor-color "#cccccc")
 '(custom-safe-themes
   (quote
    ("900e1778453b1a015f8deddcf0a5ec75e7c1a9bb7ff8a99c5aeb0d92762587da" default)))
 '(foreground-color "#cccccc")
 '(package-selected-packages
   (quote
    (yasnippet-bundle yasnippet which-key web-mode w3m use-package twittering-mode scss-mode rainbow-mode python3-info python-pep8 python-mode powerline-evil key-chord json-mode js2-mode jedi-direx helm-projectile helm-gtags helm-ag helm-ack gtags fullframe flymake-sass flymake-python-pyflakes flymake-csslint flymake-css flycheck evil-visualstar evil-tabs evil-surround evil-smartparens evil-search-highlight-persist evil-numbers evil-matchit evil-magit evil-leader evil-jumper evil-indent-textobject evil-exchange evil-commentary evil-anzu elscreen-separate-buffer-list bpr ack ac-etags)))
 '(safe-local-variable-values (quote ((no-byte-compile t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
