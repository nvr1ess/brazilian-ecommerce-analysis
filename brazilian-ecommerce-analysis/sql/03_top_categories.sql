select
	ct.product_category_name_english,
	sum(oit.price + oit.freight_value) as order_item_total
from order_items oit
	join orders o on o.order_id = oit.order_id
	join products p on oit.product_id = p.product_id
	join category_translation ct on p.product_category_name = ct.product_category_name
where o.order_status = 'delivered'
group by ct.product_category_name_english
order by order_item_total desc
limit 10