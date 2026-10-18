# Interview Explanation

## 60-second version
I built an end-to-end retail analytics solution in Microsoft Fabric. I stored raw CSV data in OneLake through a Fabric Lakehouse and implemented a medallion architecture using PySpark notebooks. The Bronze layer ingests source data, Silver performs cleansing, type standardization, deduplication and validation, and Gold creates fact and dimension tables for analytics. I orchestrated the notebooks with a Fabric Data Factory pipeline and added data-quality checks that fail the workflow for critical issues. For consumption, I query the Gold Delta tables through the SQL analytics endpoint and use a Direct Lake semantic model in Power BI. I also version the solution with GitHub integration and would promote changes through Development, Test and Production workspaces.

## Topics to explain in detail
- Why medallion architecture
- OneLake and Delta tables
- PySpark transformations
- Data-quality checks
- Star-schema design
- Pipeline orchestration
- SQL analytics endpoint
- Direct Lake
- Git integration
- Dev/Test/Prod deployment approach
