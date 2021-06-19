-- найти всю информацию о заказе по номеру заказа

Select 
public.invoices.ordernumber,
--public.invoices.comment as "invoices.comment",
public.purchases.comment  as "для кого",
public.purchases.buyingprice as "цена покупки",
public.nomenclatures.nomenclature as "товар",
public.purchases.count as "кол-во",
public.nomenclatures.code as "1c код товара",
public.purchases.resolvingdate as "товар получен",
public.invoices.resolveddate as "инвойс закрыт",
public.invoices.id as "invoices.id",
public.purchases.id as "purchases.id",
public.purchases.nomenclatureid

from public.invoices

left join public.purchases on public.invoices.id = public.purchases.invoiceid
left join public.nomenclatures on public.nomenclatures.id = public.purchases.nomenclatureid
where public.invoices.ordernumber = 'WL-REQ-000000011585';



-- Редактируем инвойс

Select 
public.invoices.ordernumber,
public.invoices.comment,
public.invoices.resolveddate,
public.invoices.id

from public.invoices

left join public.purchases on public.invoices.id = public.purchases.invoiceid
left join public.nomenclatures on public.nomenclatures.id = public.purchases.nomenclatureid
where public.invoices.ordernumber = 'WL-REQ-000000011585';

-- Редактируем purchase

Select 
public.purchases.comment,
public.purchases.buyingprice,
public.purchases.count,
public.purchases.resolvingdate,
public.purchases.id

from public.invoices

left join public.purchases on public.invoices.id = public.purchases.invoiceid
left join public.nomenclatures on public.nomenclatures.id = public.purchases.nomenclatureid
where public.invoices.ordernumber = 'WL-REQ-000000011585';
