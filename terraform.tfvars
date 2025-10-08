capacity_id ="15F1D84D-B4A4-4754-92D1-54C4CD85B9F3"
deployment_admin_object_id="b78cce47-7bb8-445d-9fad-f3776dbef83e"

workspace_configs = [
  {
    name         = "Terraform_demo_DE_Dev"
    lakehouse    = "Terraform_demo_Fabric_Lakehouse"
    warehouse    = "Terraform_demo_Fabric_Warehouse"
    pipelineStage = "Development"
    folders      = [
      { name = "Notebooks" },
      { name = "Pipelines" },
      { name = "Reports" }
    ]
  },
  {
    name         = "Terraform_demo_DE_Prod"
    lakehouse    = ""          # add empty string
    warehouse    = ""          # add empty string
    pipelineStage = "Production"
    folders      = [
      { name = "Notebooks" },
      { name = "Pipelines" }
    ]
  },
  {
    name         = "Terraform_demo_Report"
    lakehouse    = ""          # add empty string
    warehouse    = ""          # add empty string
    pipelineStage = ""         # add empty string
    folders      = []          # add empty list
  }
]

