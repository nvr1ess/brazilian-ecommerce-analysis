with total_value_by_orders as (
	select
		oit.order_id,
		to_char(o.order_purchase_timestamp, 'YYYY-MM') as month,
		sum(oit.price + oit.freight_value) as total_value
	from order_items oit
		join orders o on oit.order_id = o.order_id
	where order_status = 'delivered'
	group by oit.order_id, to_char(o.order_purchase_timestamp, 'YYYY-MM')
)

select
	month,
	round(avg(total_value), 2) as avg_value,
	count(*) as cnt_orders
from total_value_by_orders
group by month
order by month