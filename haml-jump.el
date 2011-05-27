(require 'thingatpt)
(defun jump-to-view ()
  "jumps to the corresponding haml view"
  (interactive)
  (let ((sentence (thing-at-point 'sentence)))
    (if (string-match ".*haml(?[[:blank:]]*:\\(?:'\\|\"\\)?\\([^\"\', \f\t\n\r\v]+\\).*" sentence)
        (let ((file (match-string-no-properties 1 sentence)))
          (if (one-window-p)
              (split-window-vertically))
          (select-window (next-window))
          (find-file (concat "/home/keerthi/work/artha42/phr_app/" (concat "app/views/" (concat file ".haml"))))))))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x j") 'jump-to-view)))

(provide 'haml-jump)
