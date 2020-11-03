Select purchases.count, purchases.resolvingdate
from purchases
where purchases.invoiceid = 
(Select id from invoices
where invoices.ordernumber  = 'WL-REQ-000000012200')