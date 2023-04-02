data "terraform_remote_state" "eks-iam" {
    backend = "s3"
    config = {
        bucket = var.iam-data-bucket
        key = var.iam-data-key
        region = var.iam-data-region
    }
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.name
  role_arn =  "${data.terraform_remote_state.eks-iam.outputs.iam-eks-cluster-role-arn}"
  version  = var.cluster-version
  tags = var.tags

# Adding VPC Configuration
  vpc_config {             # Configure EKS with vpc and network settings 
    security_group_ids =  var.cluster-sg
    subnet_ids         = var.eks-subnets
    endpoint_private_access = true
    endpoint_public_access = false
  }

  encryption_config {
    resources = ["secrets"]

    provider {
      key_arn = var.key_arn
    }
  }
}
