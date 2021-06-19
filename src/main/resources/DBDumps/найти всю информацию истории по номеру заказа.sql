-- найти всю информацию истории по номеру заказа

Select 
public.invoices.ordernumber as "№ заказа",
public.steps.name as "шаг",
public.stepcomments.comment as "info шага",
public.invoices.id as "id заказа",
public.histories.id as "id histories",
public.stepcomments.id as "id stepcomments"

from public.invoices

left join public.histories on public.invoices.id = public.histories.invoiceid
left join public.steps on public.steps.id = public.histories.stepid
left join public.stepcomments on public.stepcomments.historyid = public.histories.id
where public.invoices.ordernumber = 'WL-REQ-000000011611';

-- редактировать истории по номеру заказа
Select stepcomments.comment, stepcomments.submitdate, stepcomments.customerid, stepcomments.id  from stepcomments
left join public.histories on public.stepcomments.historyid = public.histories.id
left join public.invoices on public.invoices.id = public.histories.invoiceid
where public.invoices.ordernumber = 'WL-REQ-000000011611';