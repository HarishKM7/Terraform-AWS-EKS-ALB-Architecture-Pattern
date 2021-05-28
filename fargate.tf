resource "aws_eks_fargate_profile" "fargate_profile" {
  cluster_name           = module.eks.cluster_id
  fargate_profile_name   = "fargate-profile"
  pod_execution_role_arn = aws_iam_role.fargate_role.arn
  subnet_ids             = var.private_subnets

  selector { namespace = "default" }
  selector { namespace = "kube-system" }
  selector { namespace = "kube-public" }
}

resource "aws_iam_role" "fargate_role" {
  name = "fargate-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "eks-fargate-pods.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "farget_role_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.fargate_role.name
}
