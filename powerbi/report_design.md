# Power BI Report Design

Build the semantic model from the Gold Delta tables using **Direct Lake**.

## Tables
- `gold_fact_sales`
- `gold_dim_customer`
- `gold_dim_product`
- `gold_dim_date` — mark as the date table using the `date` column
- `gold_sales_summary` (optional, for fast summary visuals)

## Relationships (single direction, dimension → fact)
- `gold_dim_customer[customer_id]` 1 → * `gold_fact_sales[customer_id]`
- `gold_dim_product[product_id]` 1 → * `gold_fact_sales[product_id]`
- `gold_dim_date[date]` 1 → * `gold_fact_sales[order_date]`

Sort `gold_dim_date[month_name]` by `gold_dim_date[month]`, and hide key columns on the fact table.

## Page 1 - Executive Overview
- KPI cards: Total Sales, Gross Profit, Gross Margin %, Total Orders, Sales YoY %
- Line chart: Total Sales and Sales PY by `gold_dim_date[year_month]`
- Bar chart: Total Sales by region
- Column chart: Total Sales by category
- Slicers: region, segment, category, year

## Page 2 - Product Analysis
- Top 10 products by Total Sales
- Gross Profit and Gross Margin % by category
- Units Sold by product
- Matrix: category > product

## Page 3 - Customer and Regional Analysis
- Total Sales by region and state
- Sales by customer segment
- Top customers by Total Sales
