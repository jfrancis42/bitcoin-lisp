# bitcoin-lisp
A Common Lisp client for getting current Bitcoin prices in various
world currencies from the Coindesk API.

This library could hardly be any more simple. It has two functions. It
can pull the currently Bitcoin price from the Coindesk API in any one
of the world currencies, and it can pull a list of those currencies
(and their ISO 4217 designators) from the Coindesk site, so you know
which ones are valid.

The use of this data  in another program is free, but requires
attribution to Coindesk. See the following page for details:

https://www.coindesk.com/api/

### Example usage:

````
CL-USER> (bitcoin:bitcoin-price "USD")
((:TIME (:UPDATED . "Sep 7, 2017 01:27:00 UTC")
  (:UPDATED-+ISO+ . "2017-09-07T01:27:00+00:00")
  (:UPDATEDUK . "Sep 7, 2017 at 02:27 BST"))
 (:DISCLAIMER
  . "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org")
 (:BPI
  (:+USD+ (:CODE . "USD") (:RATE . "4,561.9150")
   (:DESCRIPTION . "United States Dollar") (:RATE--FLOAT . 4561.915))))
CL-USER> (cdr (assoc :rate--float (cdr (assoc :+usd+ (cdr (assoc :bpi (bitcoin:bitcoin-price "USD")))))))
4561.915
CL-USER> 
````

````
CL-USER> (bitcoin:supported-currencies)
(((:CURRENCY . "AED") (:COUNTRY . "United Arab Emirates Dirham"))
 ((:CURRENCY . "AFN") (:COUNTRY . "Afghan Afghani"))
 ((:CURRENCY . "ALL") (:COUNTRY . "Albanian Lek"))
 ((:CURRENCY . "AMD") (:COUNTRY . "Armenian Dram"))
 ((:CURRENCY . "ANG") (:COUNTRY . "Netherlands Antillean Guilder"))
 ((:CURRENCY . "AOA") (:COUNTRY . "Angolan Kwanza"))
 ((:CURRENCY . "ARS") (:COUNTRY . "Argentine Peso"))

	...blah blah blah...

 ((:CURRENCY . "XOF") (:COUNTRY . "CFA Franc BCEAO"))
 ((:CURRENCY . "XPF") (:COUNTRY . "CFP Franc"))
 ((:CURRENCY . "YER") (:COUNTRY . "Yemeni Rial"))
 ((:CURRENCY . "ZAR") (:COUNTRY . "South African Rand"))
 ((:CURRENCY . "ZMK") (:COUNTRY . "Zambian Kwacha (pre-2013)"))
 ((:CURRENCY . "ZMW") (:COUNTRY . "Zambian Kwacha"))
 ((:CURRENCY . "ZWL") (:COUNTRY . "Zimbabwean Dollar")))
CL-USER>
````
