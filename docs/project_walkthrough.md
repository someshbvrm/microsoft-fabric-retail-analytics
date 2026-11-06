# Project Walkthrough

## Summary
This project is an end-to-end retail analytics solution in Microsoft Fabric. Raw CSV data is stored in OneLake through a Fabric Lakehouse and processed with a medallion architecture in PySpark notebooks:

- **Bronze** ingests the source files unchanged, with ingestion audit columns.
- **Silver** applies explicit types, cleanses and standardizes text, removes duplicates and rejects invalid rows.
- **Gold** builds a star schema (customer, product and date dimensions plus a sales fact) for analytics.

A Fabric Data Factory pipeline runs the notebooks in sequence, and a data-quality notebook fails the run before Gold is rebuilt if any critical rule is broken. The Gold Delta tables are written with V-Order and consumed through the SQL analytics endpoint and a Direct Lake semantic model in Power BI. The solution is version-controlled in Git, with a documented Development, Test and Production promotion approach.

## Key design decisions
- **Medallion architecture** — separates raw, cleansed and business-ready data so each layer can be reprocessed and audited independently.
- **OneLake and Delta tables** — one copy of the data serves Spark, SQL and Power BI.
- **PySpark transformations** — explicit schemas, trimming, de-duplication on business keys and row-count reconciliation.
- **Data-quality gate** — uniqueness, completeness, validity, amount reconciliation and referential-integrity rules.
- **Star schema with a date dimension** — supports time intelligence such as YTD, prior year and year-over-year.
- **Pipeline orchestration** — each notebook runs only after the previous one succeeds.
- **V-Order on Gold** — read-optimized Parquet layout for Direct Lake and the SQL analytics endpoint.
- **Git integration** — workspace items synchronized with GitHub; Dev/Test/Prod promotion via deployment pipelines.
