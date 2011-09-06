;; Disable the startup message
(setq inhibit-startup-message t)

;; no splash screen
(setq inhibit-splash-screen t)

;; set (yes or no) to (y or n)
(fset 'yes-or-no-p 'y-or-n-p)

;; disable autosave and backup files
(setq make-backup-files nil)
(setq auto-save-default nil)


(progn
  ;; no toolbar
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  ;;no menubar
  (menu-bar-mode -1)
  ;; no scroll bar
  (scroll-bar-mode -1)
  )

;; change tab to space
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Enable IDO mode.
(ido-mode t)

;; Toggle Fullscreen mode
(global-set-key "\C-f" 'ns-toggle-fullscreen)

;; wombat theame
(load-theme 'wombat)

(provide 'environment)
