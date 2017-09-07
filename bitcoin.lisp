;;;; bitcoin.lisp

(in-package #:bitcoin)

;;; "bitcoin" goes here. Hacks and glory await!

(defun supported-currencies ()
  (json:decode-json-from-string
    (first
     (multiple-value-list
      (drakma:http-request
       "https://api.coindesk.com/v1/bpi/supported-currencies.json"
       :method :get
       :accept "application/json")))))

(defun bitcoin-price (&optional (code "USD"))
  (json:decode-json-from-string
   (babel:octets-to-string
    (first
     (multiple-value-list
      (drakma:http-request
       (concatenate
	'string
	"https://api.coindesk.com/v1/bpi/currentprice/" code ".json")
       :method :get
       :accept "application/json"))))))

