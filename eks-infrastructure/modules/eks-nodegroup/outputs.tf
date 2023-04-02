output "eks-nodegroup-arn" {
    description = "EKS NodeGroup ARN"
    value = aws_eks_node_group.eks-nodegroup.arn
}