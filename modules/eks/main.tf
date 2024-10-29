module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 18.0"  # Ensure compatibility
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  node_groups = {
    default = {
      desired_capacity = 1
      min_size         = 1
      max_size         = 2
      instance_types   = ["t3.medium"]
      subnets          = var.subnet_ids
    }
  }

  # Manage IAM roles externally
  manage_aws_auth = false
}
