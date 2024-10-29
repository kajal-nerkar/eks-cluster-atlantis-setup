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

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = yamlencode([
      {
        rolearn  = module.eks.worker_iam_role_arns[0]
        username = "system:node:{{EC2PrivateDNSName}}"
        groups   = ["system:bootstrappers", "system:nodes"]
      },
      {
        rolearn  = module.iam.eks_admin_role_arn
        username = "eks-admin"
        groups   = ["system:masters"]
      },
      {
        rolearn  = module.iam.eks_readonly_role_arn
        username = "eks-read-only"
        groups   = ["system:authenticated"]
      }
    ])
  }

  depends_on = [module.eks, module.iam]
}
