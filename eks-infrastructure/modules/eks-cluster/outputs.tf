output "eks-cluster-id" {
   description = "EKS Cluster ID"
   value = aws_eks_cluster.eks_cluster.id
}

output "eks-cluster-arn" {
    description = "EKS Cluster ARN"
    value = aws_eks_cluster.eks_cluster.arn
}

output "eks-cluster-name" {
    description = "EKS Cluster Name"
    value = aws_eks_cluster.eks_cluster.name
}

output "eks-cluster-endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}