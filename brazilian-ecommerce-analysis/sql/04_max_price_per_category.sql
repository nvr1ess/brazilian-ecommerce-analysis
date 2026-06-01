with ranked_product as (
	select
		ct.product_category_name_english,
		oit.product_id,
		oit.price,
		row_number() over (partition by p.product_category_name order by price desc) as rn
	from order_items oit
		join products p on oit.product_id = p.product_id
		join category_translation ct on p.product_category_name = ct.product_category_name
)

select 
	product_category_name_english as category,
	product_id,
	price
from ranked_product
where rn = 1