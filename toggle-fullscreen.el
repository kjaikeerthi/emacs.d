;;
;; Toggle to Fullscreen using F11 key
;;
(add-to-list 'load-path (concat emacs-home "toggle-fullscreen"))
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
			 (if (equal 'fullboth current-value)
			     (if (boundp 'old-fullscreen) old-fullscreen nil)
			   (progn (setq old-fullscreen current-value)
				  'fullboth)))))
(global-set-key [f11] 'toggle-fullscreen)
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
		       '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
		       '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
(add-hook 'after-make-frame-functions 'toggle-fullscreen)
(provide 'toggle-fullscreen)
