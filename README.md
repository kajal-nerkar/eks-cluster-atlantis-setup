# eks-cluster-atlantis-setup

## Overview
Objective: Deploy an EKS cluster and the Atlantis application using Terraform and Helm, integrated with your GitHub repository.

##Tools Used:
Terraform: Infrastructure as Code (IaC) tool for provisioning AWS resources.
Helm: Package manager for Kubernetes to deploy applications like Atlantis.
AWS EKS: Managed Kubernetes service by AWS.
Atlantis: Tool for automating Terraform workflows via pull requests.

## Project Structure
```

aws-eks-atlantis/
├── README.md                # Instructions and project overview
├── main.tf                  # Root Terraform configuration file
├── variables.tf             # Input variables for the root module
├── outputs.tf               # Output values from the root module
├── providers.tf             # Provider configurations
├── terraform.tfvars         # Variable values (ensure sensitive data is secured)
├── modules/
│   ├── vpc/
│   │   ├── main.tf          # VPC resource definitions
│   │   ├── variables.tf     # VPC module variables
│   │   └── outputs.tf       # VPC module outputs
│   ├── eks/
│   │   ├── main.tf          # EKS resource definitions
│   │   ├── variables.tf     # EKS module variables
│   │   └── outputs.tf       # EKS module outputs
│   ├── iam/
│   │   ├── main.tf          # IAM roles and policies
│   │   ├── variables.tf     # IAM module variables
│   │   └── outputs.tf       # IAM module outputs
│   └── helm/
│       ├── main.tf          # Helm release definitions (Atlantis)
│       ├── variables.tf     # Helm module variables
│       └── outputs.tf       # Helm module outputs
└── .gitignore               # Git ignore file to exclude sensitive files
