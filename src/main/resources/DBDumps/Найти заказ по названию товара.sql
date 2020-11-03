Select * from public.invoices
where public.invoices.id in (
	Select public.purchases.invoiceid from public.purchases
	where public.purchases.nomenclatureid = 
		(select id from public.nomenclatures
		where public.nomenclatures.nomenclature = 'Battery for 5480'));
		
		
		
Select * from public.purchases
	where public.purchases.nomenclatureid = 
		(select id from public.nomenclatures
		where public.nomenclatures.nomenclature = 'Battery for 5480');