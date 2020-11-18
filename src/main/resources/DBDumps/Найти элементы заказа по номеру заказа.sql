Select purchases.id, 
purchases.count, 
purchases.resolvingdate
from purchases
where purchases.invoiceid =
(Select id from invoices
where invoices.ordernumber  = 'WL-REQ-000000009307');


Select invoices.id,
invoices.resolveddate,
invoices.invoicenumber
 from invoices
where invoices.ordernumber like '%9307%'