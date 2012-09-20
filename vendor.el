(require 'package)

(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)


(add-to-list 'load-path package-home)

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))

(setq ack-executable "/usr/local/bin/ack")

(setq el-get-sources
      '((:name inf-ruby  :type elpa)
        (:name ruby-compilation :type elpa)
        (:name flymake-haml :type elpa)
        (:name flymake-ruby :type elpa)
        (:name flymake-shell :type elpa)
        (:name flymake-jslint :type elpa)
        (:name jabber :type elpa)
        (:name rinari :type elpa)
        (:name jade-mode :type elpa)
        (:name scss-mode :type elpa)
        (:name inf-ruby :ype elpa)
        (:name ruby-electric :type elpa)
        (:name ruby-block :type elpa)
        (:name ruby-end :type elpa)
        (:name rspec-mode :type elpa)
        (:name scss-mode :type elpa)
        (:name ssh :type elpa)
        (:name w3 :type elpa)
        (:name ace-jump-mode
               :type elpa
               :load "ace-jump-mode.el"
               :after (progn ()
                             (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
                             )
               )
        (:name css-mode
               :type elpa
               :after (progn () (css-mode-hook)))
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el"
               :after(progn ()
                       (global-set-key (kbd "C-x C-x") 'textmate-goto-file)
                       ))
        (:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (progn() (rvm-use-default)))
        (:name rhtml
               :type git
               :url "https://github.com/eschulte/rhtml.git"
               :features rhtml-mode
               :after (progn () (rhtml-mode-hook)))
        (:name markdown-mode
               :type git
               :url "https://github.com/defunkt/markdown-mode.git"
               :features markdown-mode
               :after (progn () (markdown-mode-hook)))
        (:name haml-mode
               :type git
               :url "https://github.com/nex3/haml-mode.git"
               :features haml-mode
               :after (progn () (haml-mode-hook)))
        (:name yaml-mode
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode
               :after (progn () (yaml-mode-hook)))
        (:name popup :type elpa)
        (:name auto-complete
               :type elpa
               :post-init (progn ()
                            (require 'auto-complete)
                            (add-to-list 'ac-dictionary-directories (expand-file-name "dict" pdir))
                            (require 'auto-complete-config)
                            (ac-config-default)
                            ))
        (:name magit
               :after (progn ()
                        (global-set-key (kbd "C-x C-z") 'magit-status)
                        ))
        ;; (:name dictionary-el    :type apt-get)
        ;; (:name emacs-goodies-el :type apt-get)
       ))
(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation))))
(ruby-mode-hook)

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun markdown-mode-hook ()
  (autoload 'markdown-mode "markdown-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  ;; (add-hook 'css-mode-hook '(lambda ()
  ;;                             (setq css-indent-level 2)
                              ;; (setq css-indent-offset 2)))
  )

(defun haml-mode-hook ()
  (autoload 'haml-mode "haml-mode" nil t)
)

;; (el-get)

(setq my-packages
      (append
       '(cssh switch-window vkill google-maps xcscope color-theme cheat full-ack gist)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(provide 'vendor)
