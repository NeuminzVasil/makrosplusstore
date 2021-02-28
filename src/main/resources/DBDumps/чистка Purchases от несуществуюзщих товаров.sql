-- найти все элементы заказов(purchases.id) с кодами товаров (nomenclatures.id), которых не существует в таблице nomenclatures
select 
purchases.id as purchasesID,
purchases.nomenclatureid,
nomenclatures.id
from purchases
left join nomenclatures on nomenclatures.id = purchases.nomenclatureid 
where nomenclatures.nomenclature is null;

-- (успешно работаетна удаление)удалить все элементы заказов(purchases.id) с кодами товаров (nomenclatures.id), которых не существует в таблице nomenclatures
--delete from purchases
--where purchases.id in (
--select 
--purchases.id
--from purchases
--left join nomenclatures on nomenclatures.id = purchases.nomenclatureid 
--where nomenclatures.nomenclature is null);

select * from nomenclatures 
where nomenclatures.id = 73
or nomenclatures.id = 347
or nomenclatures.id = 449;

select * from purchases 
where purchases.id = 3354;