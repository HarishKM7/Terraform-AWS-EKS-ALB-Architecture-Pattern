module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = ">= 17.0.0"
  cluster_name    = var.cluster_name
  cluster_version = "1.20"
  vpc_id          = var.vpc
  subnets         = var.public_subnets
  manage_aws_auth = false
}
