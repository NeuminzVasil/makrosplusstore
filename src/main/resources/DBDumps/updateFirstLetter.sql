update store.nomenclatures
set nomenclature = overlay(nomenclature placing ')' from position(' )' in nomenclature) for 2) 
where nomenclature like '% )%';
