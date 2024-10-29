# variables.tf

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
  default     = "eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.21"
}

variable "github_token" {
  description = "GitHub Personal Access Token for Atlantis"
  type        = string
  sensitive   = true
}

variable "github_repo_owner" {
  description = "GitHub username or organization owning the repo"
  type        = string
}

variable "github_repo_name" {
  description = "GitHub repository name"
  type        = string
}
