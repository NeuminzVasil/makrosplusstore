-- найти все заказы и елементы заказов
select * from invoices
inner join purchases on invoices.id = purchases.invoiceid;

-- найти заказ по id товара 
select invoices.ordernumber, 
		invoices."comment",
		invoices.totalprice,  
		nomenclatures.nomenclature,
		invoices.datacreate, 
		invoices.resolveddate
from invoices
inner join purchases on invoices.id = purchases.invoiceid -- к заказам подключеем таблицу елементов заказа
inner join nomenclatures on nomenclatures.id = purchases.nomenclatureid -- к полученному объединению подключаем таблицу товаров
inner join customers on invoices.customerid = customers.id -- к полученному объединению подключаем табицу пользователей
where purchases.nomenclatureid = 72; -- из полученного результата выбираем строки только с соответствующим ID товара

-- найти заказ по названию товара 
select invoices.ordernumber, 
		invoices."comment",
		invoices.totalprice,  
		nomenclatures.nomenclature,
		invoices.datacreate, 
		invoices.resolveddate
from invoices
inner join purchases on invoices.id = purchases.invoiceid
inner join nomenclatures on nomenclatures.id = purchases.nomenclatureid 
inner join customers on invoices.customerid = customers.id 
where nomenclatures.nomenclature like '%650%ерный%';


