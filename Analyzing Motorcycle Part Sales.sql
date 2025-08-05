----Find out how much Wholesale net revenue each product_line generated per month per warehouse in the dataset.
--  1) The query should be saved as revenue_by_product_line using the SQL cell provided, and contain the following:
    ---a) product_line,
    ---b) month: displayed as 'June', 'July', and 'August',
    ---c) hwarehouse, and
    ---d) net_revenue: the sum of total minus the sum of payment_fee.
--  2) The results should be sorted by product_line and month, followed by net_revenue in descending order.

SELECT
	product_line,
	CASE WHEN DATE_PART('month', date) = 6 THEN 'June'
		  WHEN DATE_PART('month', date) = 7 THEN 'July'
		  WHEN DATE_PART('month', date) = 8 THEN 'August'
	END AS month,
	warehouse,
	SUM(total)-SUM(payment_fee) AS net_revenue
	FROM sales
WHERE client_type='Wholesale'
GROUP BY product_line, month, warehouse
ORDER BY product_line, month, net_revenue DESC
