;;;; bitcoin.asd

(asdf:defsystem #:bitcoin
  :description "A Common Lisp client for getting current Bitcoin prices in various world currencies from the Coindesk API."
  :author "Jeff Francis <jeff@gritch.org>"
  :license "MIT, see file LICENSE"
  :depends-on (#:cl-json
               #:drakma
               #:babel)
  :serial t
  :components ((:file "package")
               (:file "bitcoin")))

