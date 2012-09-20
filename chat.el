(require 'jabber)


(setq jabber-account-list '(
                            ("jai@activesphere.com"
                            ;;   (:password . nil) or (:password . "your-pass")
                             (:network-server . "talk.google.com")
                             (:port . 443)
                             (:connection-type . ssl))
                            ))
(provide 'chat)
