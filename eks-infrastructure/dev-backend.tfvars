region = "us-east-1"
bucket         = "kinsale-terraform-state-dev"
key            = "dev/infra/eks-cluster.tfstate"
dynamodb_table = "kinsale-terraform-state-dev-locks"
encrypt        = true