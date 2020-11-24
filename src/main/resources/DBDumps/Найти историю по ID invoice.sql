Select histories.customerid, customers.login, steps.name, stepcomments.comment, stepcomments.submitdate
from histories, steps, stepcomments, customers
where histories.invoiceid = 1554
and histories.stepid = steps.id
and stepcomments.historyid = histories.id
and customers.id = stepcomments.customerid
order by stepcomments.submitdate