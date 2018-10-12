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

(unless (package-installed-p 'sublime-themes)
  (package-install 'sublime-themes))

(unless (package-installed-p 'helm-ag)
  (package-install 'helm-ag))
;; (disable-theme 'zenburn)
;; (load-theme 'spolsky t)
(setq cider-prompt-for-symbol nil)
;; personal.el ends here
;; re-frame cider
(setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")

;; install elm-mode
(unless (package-installed-p 'elm-mode)
  (package-install 'elm-mode))
(add-to-list 'company-backends 'company-elm)

(setq prelude-guru nil)
(setq-default cursor-type 'bar)
(set-cursor-color "#ffffff")

(unless (package-installed-p 'flycheck-inline)
  (package-install 'flycheck-inline))

;; ============== RUST =====================
(unless (package-installed-p 'rust-mode)
  (package-install 'rust-mode))

(unless (package-installed-p 'cargo)
  (package-install 'cargo))

(unless (package-installed-p 'racer)
  (package-install 'racer))

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(unless (package-installed-p 'flycheck-rust)
  (package-install 'flycheck-rust))

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(with-eval-after-load 'flycheck
  (flycheck-inline-mode))

;;; personal.el ends here
