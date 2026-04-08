select * from amazon_sales_fixed limit 10;

select category, count(*) as total_orders from amazon_sales_fixed group by category limit 10;

select fulfilment, count(*) as total_orders, sum(cast(nullif(qty,'') as integer)) as total_units_sold, sum(cast(nullif(amount,'') as double)) as total_revenue from amazon_sales_fixed where status not like 'cancelled%' and status not like 'pending%' group by fulfilment order by total_revenue desc limit 10;

select date_format(date_parse(date,'%m-%d-%y'),'%Y-%m') as month, count(*) as total_orders, sum(cast(nullif(amount,'') as double)) as total_revenue from amazon_sales_fixed where status not like 'cancelled%' and status not like 'pending%' group by date_format(date_parse(date,'%m-%d-%y'),'%Y-%m') order by month asc limit 10;

with ranked_skus as (select category, sku, sum(cast(nullif(amount,'') as double)) as total_revenue, sum(cast(nullif(qty,'') as integer)) as total_units_sold, row_number() over (partition by category order by sum(cast(nullif(amount,'') as double)) desc) as sku_rank from amazon_sales_fixed where status not like 'cancelled%' and status not like 'pending%' and cast(nullif(qty,'') as integer) > 0 group by category, sku) select category, sku, total_revenue, total_units_sold, sku_rank from ranked_skus where sku_rank <= 5 limit 10;