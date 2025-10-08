# Terraform + Fabric Deployment

Simple guide to install tools and deploy Fabric workspaces using Terraform on Windows.

---

## 1. Install Tools

### Chocolatey
Open PowerShell as Admin:

Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Check version:

choco -v

### Terraform

choco install terraform -y
terraform -v

### Fabric CLI (optional)

choco install microsoft-fabric-cli -y
fabric --version

---

## 2. Credentials

Option 1: `.env` file  

Create `.env` in the project folder:

ARM_CLIENT_ID=your-client-id  
ARM_CLIENT_SECRET=your-client-secret  
ARM_TENANT_ID=your-tenant-id  
FABRIC_CAPACITY_ID=your-capacity-uuid  
FABRIC_ADMIN_OBJECT_ID=your-user-object-id  

Load in PowerShell:

Get-Content .\.env | ForEach-Object { $parts = $_ -split '='; Set-Item -Path Env:$($parts[0]) -Value $parts[1] }

Option 2: `terraform.tfvars`  

Put credentials and workspace configs directly in `terraform.tfvars` (see example in project).

---

## 3. Initialize Terraform
cd "C:\path\to\your\project\fabric-deployer-terraform"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\load_env.ps1
terraform init

---

## 4. Plan Deployment

terraform plan -out=tfplan

Check resources to be created (workspaces, lakehouse, warehouse, folders, deployment pipeline, admin assignments).

---

## 5. Apply Deployment

terraform apply tfplan

---

## 6. Destroy Deployment (Optional)

terraform destroy

**Warning:** Deletes everything created by this project.
