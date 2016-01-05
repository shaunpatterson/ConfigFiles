;;; flymake-csslint-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "flymake-csslint" "flymake-csslint.el" (22152
;;;;;;  47747 0 0))
;;; Generated autoloads from flymake-csslint.el

(autoload 'flymake-csslint-init "flymake-csslint" "\


\(fn)" nil nil)

(eval-after-load 'flymake '(progn (add-to-list 'flymake-allowed-file-name-masks '(".+\\.css$" flymake-csslint-init flymake-simple-cleanup flymake-get-real-file-name)) (add-to-list 'flymake-err-line-patterns '("^\\(.*\\): line \\([[:digit:]]+\\), col \\([[:digit:]]+\\), \\(.+\\)$" 1 2 3 4)) (add-hook 'css-mode-hook (lambda nil (flymake-mode 1)) t)))

;;;***

;;;### (autoloads nil nil ("flymake-csslint-pkg.el") (22152 47747
;;;;;;  15128 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; flymake-csslint-autoloads.el ends here
