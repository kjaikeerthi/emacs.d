(defvar emacs-home "~/.emacs.d/")
(defvar package-home (concat emacs-home "el-get/el-get/"))
(add-to-list 'load-path emacs-home)

;; My emacs environment.(i.e) UI which appears.
(require 'environment)

(require 'vendor)

(require 'haml-jump)

;; (require 'chat)
