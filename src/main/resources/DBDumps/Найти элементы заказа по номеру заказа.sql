Select purchases.count, purchases.resolvingdate
from purchases
where purchases.invoiceid =
(Select id from invoices
where invoices.ordernumber  = 'WL-REQ-000000012200');


Select invoices.id,
invoices.resolveddate,
invoices.invoicenumber
 from invoices
where invoices.ordernumber like '%12200%'