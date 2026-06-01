select
	ct.product_category_name_english,
	count(*) as cnt_sold,
	round(avg(price), 2) as avg_price,
	sum(price + freight_value) as revenue
from order_items oit
	join orders o on oit.order_id = o.order_id
	join products p on oit.product_id = p.product_id
	join category_translation ct on p.product_category_name = ct.product_category_name
where o.order_status = 'delivered'
group by ct.product_category_name_english
order by revenue desc