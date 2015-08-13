(prelude-require-packages '(multiple-cursors))
;; === multi=cursor-keys ============
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ==== magit defaults ============
(setq magit-push-always-verify nil)

;; personal.el ends here
