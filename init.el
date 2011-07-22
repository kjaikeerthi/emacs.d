(defvar emacs-home "~/.emacs.d/")
(defvar package-home (concat emacs-home "el-get/el-get/"))
(add-to-list 'load-path emacs-home)

;; My emacs environment.(i.e) UI which appears.
(require 'environment)


;; install elget if not available
;; (unless (require 'el-get nil t)
;;   (url-retrieve
;;    "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
;;    (lambda (s)
;;      (end-of-buffer)
;;      (eval-print-last-sexp))))
;; (el-get 'sync)

(require 'vendor)

(require 'haml-jump)

(require 'chat)
