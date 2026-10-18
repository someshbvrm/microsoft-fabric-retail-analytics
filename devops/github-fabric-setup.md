# GitHub + Microsoft Fabric Setup

1. Push this starter project to a GitHub repository.
2. Create a Fabric-enabled workspace.
3. Create `RetailLakehouse`.
4. Upload the three CSV files to `RetailLakehouse/Files/raw/`.
5. Import the notebooks and attach `RetailLakehouse`.
6. Run all notebooks once.
7. Create `PL_Retail_End_to_End`.
8. Create the Direct Lake semantic model and Power BI report.
9. In Fabric Workspace settings, enable Git integration and connect the workspace to the GitHub repository/branch.
10. Let Fabric generate and synchronize supported workspace item definitions in a dedicated folder such as `/fabric-workspace`.

## Branch strategy
- `main`: stable portfolio version
- `develop`: integration branch
- `feature/<name>`: individual changes

For an enterprise implementation, use separate Development, Test and Production Fabric workspaces and promote validated items with deployment pipelines or an automated CI/CD workflow.
