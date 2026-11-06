# GitHub + Microsoft Fabric Setup

1. Clone or fork this repository.
2. Create a Fabric-enabled workspace.
3. Create the `RetailLakehouse` Lakehouse.
4. Upload the three CSV files to `RetailLakehouse/Files/raw/`.
5. Import the notebooks and attach `RetailLakehouse` as the default Lakehouse.
6. Run all notebooks once, in order.
7. Create the `PL_Retail_End_to_End` pipeline.
8. Create the Direct Lake semantic model and the Power BI report.
9. In Workspace settings, enable Git integration and connect the workspace to the GitHub repository and branch.
10. Let Fabric synchronize the supported workspace item definitions into a dedicated folder such as `/fabric-workspace`.

## Branch strategy
- `main`: stable version
- `develop`: integration branch
- `feature/<name>`: individual changes

## Environment promotion
For an enterprise implementation, use separate Development, Test and Production Fabric workspaces. Promote validated items with Fabric deployment pipelines (or an automated CI/CD workflow), and use deployment rules or pipeline parameters to point each environment at its own Lakehouse.
