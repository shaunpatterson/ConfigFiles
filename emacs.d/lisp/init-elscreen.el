
(require 'elscreen)
(elscreen-start)

(setq elscreen-display-screen-number nil)
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)

(require 'elscreen-separate-buffer-list)
(elscreen-separate-buffer-list-mode)

(provide 'init-elscreen)
