# Power BI Report Design

Build the semantic model from the Gold Delta tables using Direct Lake.

## Relationships
- `gold_dim_customer[customer_id]` 1 -> * `gold_fact_sales[customer_id]`
- `gold_dim_product[product_id]` 1 -> * `gold_fact_sales[product_id]`

## Page 1 - Executive Overview
- KPI cards: Total Sales, Gross Profit, Gross Margin %, Total Orders
- Line chart: Total Sales by order date
- Bar chart: Total Sales by region
- Column chart: Total Sales by category
- Slicers: region, segment, category, date

## Page 2 - Product Analysis
- Top 10 products by Total Sales
- Gross Profit by category
- Units Sold by product
- Matrix: category > product

## Page 3 - Customer and Regional Analysis
- Total Sales by region/state
- Sales by customer segment
- Top customers by Total Sales
