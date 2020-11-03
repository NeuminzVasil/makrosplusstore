Select invoices.id, 
invoices.resolveddate,
invoices.invoicenumber
 from invoices
where invoices.ordernumber like '%12200%'