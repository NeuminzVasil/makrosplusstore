-- найти все элементы заказов(purchases.id) с кодами заказов (invoices.id), которых не существует в таблице invoices
select 
purchases.id as purchaseID,
invoices.id as invoiceID,
purchases.invoiceid as purchasesinvoiceid
from purchases 
left join invoices on purchases.invoiceid = invoices.id
where purchases.invoiceid is null or invoices.id is null or purchases.id is null;

-- найти все инвойсы (invoices.id) для которых нет элементов заказа (purchases.id) в таблице purchases
-- удалять такие заказы не надо , пусть храняться пустыми для общей информации (можно посмотреть дату создания\выполнения, и для кого покупалось)
select 
invoices.id as invoiceID,
purchases.id as purchaseID, 
purchases.invoiceid as purchasesinvoiceid,
invoices.*
from invoices 
left join purchases on purchases.invoiceid = invoices.id
where purchases.id is null;

Select * from invoices
where invoices.id = 1496
or invoices.id = 1518
or invoices.id = 1523;

