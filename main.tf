# main.tf

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source         = "./modules/eks"
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.public_subnet_ids
  cluster_name   = var.cluster_name
  cluster_version = var.cluster_version
}

module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
}

module "helm" {
  source           = "./modules/helm"
  github_token     = var.github_token
  github_repo_owner = var.github_repo_owner
  github_repo_name = var.github_repo_name
}
