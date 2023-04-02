data "terraform_remote_state" "eks-iam" {
    backend = "s3"
    config = {
        bucket = var.iam-data-bucket
        key = var.iam-data-key
        region = var.iam-data-region
    }
}
resource "aws_eks_node_group" "eks-nodegroup" {

  # Required
  cluster_name  = var.cluster-name
  node_role_arn = data.terraform_remote_state.eks-iam.outputs.iam-eks-nodes-role-arn
  subnet_ids    = var.eks-subnets
#subnet_ids    = 

  scaling_config {
    min_size     = var.eks-nodes-min-size
    max_size     = var.eks-nodes-max-size
    desired_size = var.eks-nodes-desired-size
  }

  # Optional
  node_group_name        = var.node-group-name
  version         = var.cluster-version

  capacity_type        = var.eks-nodegroup-capacity-type
  disk_size            = var.eks-nodegroup-disk-size
  instance_types       = var.eks-nodegroup-instance-types
  labels               = var.eks-nodegroup-labels

  tags = merge(
    var.eks-nodegroup-tags,
    { Name = var.node-group-name}
  )
}
