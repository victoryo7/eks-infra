output "eks-sg-id" {
    description = "Gets security Group ID"
    value = aws_security_group.eks-sg.id
}
