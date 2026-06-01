select
	o.order_id,
	o.order_purchase_timestamp,
	c.customer_unique_id,
	oit.price + oit.freight_value as order_item_total
from orders o
	join customers c on o.customer_id = c.customer_id
	join order_items oit on o.order_id = oit.order_id