(prelude-require-packages '(multiple-cursors))
;; === multi=cursor-keys ============
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ==== magit defaults ============
(setq magit-push-always-verify nil)

(package-refresh-contents)
(unless (package-installed-p 'clj-refactor)
  (package-install 'clj-refactor))

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(unless (package-installed-p 'neotree)
  (package-install 'neotree))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(setq nrepl-log-messages nil)

(setq prelude-guru nil)

(unless (package-installed-p 'sql-indent)
  (package-install 'sql-indent))

;; install elm-mode
(unless (package-installed-p 'elm-mode)
  (package-install 'elm-mode))
(add-to-list 'company-backends 'company-elm)

(setq-default cursor-type 'bar)
(set-cursor-color "#ffffff")
;;; personal.el ends here
