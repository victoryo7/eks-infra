region = "us-east-1"
bucket         = "kinsale-terraform-state-qa"
key            = "qa/infra/eks-cluster.tfstate"
dynamodb_table = "kinsale-terraform-state-qa-locks"
encrypt        = true