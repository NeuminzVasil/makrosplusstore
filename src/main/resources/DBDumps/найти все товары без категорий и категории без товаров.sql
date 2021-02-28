-- найти все товары без категорий и категории без товаров
select 
nomenclatures.id as nomID,
categories.id catID,
nomenclatures.categoryid as NumCatID,
nomenclatures.nomenclature, 
categories.category
from nomenclatures
full outer join 
categories on categories.id = nomenclatures.categoryid
where nomenclatures.nomenclature is null or categories.category is null;

select * from nomenclatures
where id = 352