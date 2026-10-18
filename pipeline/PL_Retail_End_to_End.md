# Fabric Data Factory Pipeline - PL_Retail_End_to_End

Create a Data Factory pipeline and add four Notebook activities.

## Dependency flow
1. `NB_Bronze_Ingestion` -> `01_bronze_ingestion`
2. On success -> `NB_Silver_Transformation` -> `02_silver_transformation`
3. On success -> `NB_Data_Quality` -> `03_data_quality_checks`
4. On success -> `NB_Gold_Business_Model` -> `04_gold_business_model`

Configure each dependency to run only when the preceding activity succeeds.

## Production extensions
- Schedule trigger
- Load-date/environment parameters
- Retry policies
- Failure notifications
- Audit table with pipeline run ID, row counts and status
- Incremental/watermark loading instead of full overwrite
