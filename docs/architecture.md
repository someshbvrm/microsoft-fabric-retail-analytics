# Architecture

```mermaid
flowchart LR
    A[CSV source files] --> B[OneLake / Lakehouse Files - raw]
    B --> C[Bronze Delta tables]
    C --> D[PySpark cleaning]
    D --> E[Silver Delta tables]
    E --> F[Data quality checks]
    F --> G[Gold fact + dimensions]
    G --> H[SQL analytics endpoint]
    G --> I[Direct Lake semantic model]
    I --> J[Power BI report]
    K[Fabric Data Factory pipeline] --> C
    K --> D
    K --> F
    K --> G
    L[GitHub] <--> M[Fabric Git integration]
```

## Design
**Bronze:** raw-source representation plus ingestion metadata.  
**Silver:** data cleansing, type standardization, deduplication and validation.  
**Gold:** star-schema-style fact/dimension tables for business analytics.

The same OneLake-backed Delta data can be used by Spark, SQL and Power BI without maintaining separate copies for each engine.
