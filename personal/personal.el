(message "starting personal")
(prelude-require-packages '(multiple-cursors))
;; === multi=cursor-keys ============
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; =========== custom overrides ============

(setq prelude-guru nil)
(setq-default cursor-type 'bar)
(add-to-list 'default-frame-alist '(cursor-color . "#ffffff"))

(setq js-indent-level 2)

(defun my-web-mode-hook ()
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-script-padding 4)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-auto-closing 1)
  (setq web-mode-enable-auto-expanding 1))

(add-hook 'web-mode-hook #'my-web-mode-hook)

;; ==== magit defaults ============
(setq magit-push-always-verify nil)

;; =========== CLOJURE =======================

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(unless (package-installed-p 'clj-refactor)
  (package-install 'clj-refactor))

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "M-["))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(setq cider-prompt-for-symbol nil)
(setq cider-default-cljs-repl 'figwheel-main)
(setq cider-save-file-on-load t)

;; ============ OTHER PACKAGES =================
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
