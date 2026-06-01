select 
	count(*) as delivered_cnt
from orders
where order_status = 'delivered'