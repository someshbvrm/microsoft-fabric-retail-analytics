-- Microsoft Fabric Lakehouse SQL analytics endpoint (T-SQL, read-only)

-- 1. Headline KPIs
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    SUM(sales_amount) AS total_sales,
    SUM(gross_profit) AS gross_profit,
    CAST(100.0 * SUM(gross_profit) / NULLIF(SUM(sales_amount), 0) AS DECIMAL(10,2)) AS gross_margin_pct
FROM gold_fact_sales;

-- 2. Sales and margin by region
SELECT
    c.region,
    SUM(f.sales_amount) AS total_sales,
    SUM(f.gross_profit) AS gross_profit,
    CAST(100.0 * SUM(f.gross_profit) / NULLIF(SUM(f.sales_amount), 0) AS DECIMAL(10,2)) AS gross_margin_pct
FROM gold_fact_sales AS f
JOIN gold_dim_customer AS c ON f.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_sales DESC;

-- 3. Sales by product category
SELECT
    p.category,
    SUM(f.sales_amount) AS total_sales,
    SUM(f.quantity) AS units_sold,
    SUM(f.gross_profit) AS gross_profit
FROM gold_fact_sales AS f
JOIN gold_dim_product AS p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- 4. Monthly trend using the date dimension
SELECT
    d.[year],
    d.[month],
    d.year_month,
    SUM(f.sales_amount) AS total_sales,
    SUM(f.gross_profit) AS gross_profit
FROM gold_fact_sales AS f
JOIN gold_dim_date AS d ON f.order_date = d.[date]
GROUP BY d.[year], d.[month], d.year_month
ORDER BY d.[year], d.[month];

-- 5. Top 10 products by sales
SELECT TOP 10
    p.product_name,
    p.category,
    SUM(f.sales_amount) AS total_sales,
    SUM(f.quantity) AS units_sold
FROM gold_fact_sales AS f
JOIN gold_dim_product AS p ON f.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY total_sales DESC;

-- 6. Category performance by segment from the pre-aggregated summary table
SELECT
    segment,
    category,
    SUM(total_sales) AS total_sales,
    SUM(orders) AS orders
FROM gold_sales_summary
GROUP BY segment, category
ORDER BY segment, total_sales DESC;
