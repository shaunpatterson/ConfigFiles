;;; init-filetypes.el -- Initialize different filetype modes
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; I have nothing substantial to say here.
;;
;;; Code:

(require 'flycheck)

;;; File type overrides.
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jinja$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jinja2$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.j2$" . web-mode))

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4))
(add-hook 'web-mode-hook  'my-web-mode-hook)

(flycheck-add-mode 'javascript-eslint 'web-mode)


(provide 'init-filetypes)

;;; init-filetypes.el ends here
