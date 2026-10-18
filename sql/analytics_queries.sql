-- Microsoft Fabric Lakehouse SQL analytics endpoint

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    SUM(sales_amount) AS total_sales,
    SUM(gross_profit) AS gross_profit,
    CAST(100.0 * SUM(gross_profit) / NULLIF(SUM(sales_amount), 0) AS DECIMAL(10,2)) AS gross_margin_pct
FROM gold_fact_sales;

SELECT
    c.region,
    SUM(f.sales_amount) AS total_sales,
    SUM(f.gross_profit) AS gross_profit
FROM gold_fact_sales AS f
JOIN gold_dim_customer AS c ON f.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_sales DESC;

SELECT
    p.category,
    SUM(f.sales_amount) AS total_sales,
    SUM(f.quantity) AS units_sold,
    SUM(f.gross_profit) AS gross_profit
FROM gold_fact_sales AS f
JOIN gold_dim_product AS p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(sales_amount) AS total_sales,
    SUM(gross_profit) AS gross_profit
FROM gold_fact_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY sales_year, sales_month;

SELECT TOP 10
    p.product_name,
    p.category,
    SUM(f.sales_amount) AS total_sales,
    SUM(f.quantity) AS units_sold
FROM gold_fact_sales AS f
JOIN gold_dim_product AS p ON f.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY total_sales DESC;
