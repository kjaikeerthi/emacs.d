(defvar emacs-home "~/.emacs.d")

(add-to-list 'load-path emacs-home)

;; My emacs environment.(i.e) UI which appears.
(require 'environment)

(require 'vendor)

(require 'haml-jump)
