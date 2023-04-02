resource "aws_security_group" "eks-sg" {
  name   = var.sg-name
  tags   = var.eks-sg-tags
  vpc_id = var.vpc_id

# Egress allows Outbound traffic from 443 

  egress {                   # Outbound Rule
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }

# Egree allow Outbound traffic from 10250
  egress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }
# Egree allow Outbound CoreDNS
  egress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks, var.cidr_blocks_2]
  }

# Egree Recommended outbound traffic
  egress {
    from_port   = 1025
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks  = [var.cidr_blocks]
  }


# Ingress allows Inbound traffic from 443 

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }

  # Ingress allows Inbound traffic from 80

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks_3]
  }

  # Ingress allows Inbound traffic from localhost

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks_4]
  }


# Ingress allow Inbound traffic from 10250
  ingress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }
# Ingress allow Inbound CoreDNS
  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks, var.cidr_blocks_2]
  }
}
