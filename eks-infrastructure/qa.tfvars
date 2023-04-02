### EKS Cluster ###

cluster-version = "1.22"

eks-cluster-tags = {
    TechContact = "dl_cloudengineering@kinsaleins.com"
    Application = "eks_cluster"
    Component = "eks_cluster"
    Environment = "qa"
}

eks-cluster-name = "eks-cluster-qa"

### IAM Backend ###

iam-data-region = "us-east-1"
iam-data-bucket = "kinsale-terraform-state-qa"
iam-data-key    = "qa/infra/iam.tfstate"

### EKS Security Group ###

sg_default = "kinsaleDefaultSecurityGroups-defaultSgId"

sg_second = "kinsaleDefaultSecurityGroups-appSgId"

sg-name = "eks_sg_qa"

vpc_id = "vpc-0b037b89bc050358b"

cidr_blocks = "10.0.0.0/8"

cidr_blocks_2 = "172.16.0.0/16"

cidr_blocks_3 = "10.0.160.0/19"

cidr_blocks_4 = "127.0.0.1/32"

eks-sg-tags = {
        TechContact = "dl_cloudengineering@kinsaleins.com"
        Application = "eks_sg"
        Component = "eks_sg"
        Environment = "qa"
}

#ci/cd role to be used for the cluster create_duration
cicd_role = "arn:aws:iam::210091639447:role/Kinsale-CICD-Generic"

### Node Group One Values ###

eks-nodegroup-tags = {
        TechContact = "dl_cloudengineering@kinsaleins.com"
        Application = "eks_nodegroup"
        Component = "eks_nodegroup"
        Environment = "qa"    
}


eks-nodegroup-disk-size = "20"
eks-nodegroup-capacity-type = "ON_DEMAND"
eks-nodes-min-size = "2"
eks-nodes-max-size = "5"
eks-nodes-desired-size = "3"
node-group-name = "eks-ng-qa"
eks-nodegroup-instance-types = ["t3.medium"]
eks-nodegroup-labels = {
        App = "Submission_Intake",
        Software = "Tomcat",
        Environment = "qa"
}


### Node Group Two Values

# node_second_group_name = "eks-ng-two-dev"

### Network values ###

eks_cibr_block_sn01 = "10.0.108.0/23"
eks_cibr_block_sn02 = "10.0.110.0/23"
eks_cibr_block_sn03 = "10.0.112.0/23"
eks_cibr_block_sn04 = "10.0.114.0/23"
eks_cibr_block_sn05 = "10.0.116.0/23"
eks_cibr_block_rt01 = "10.0.64.0/18"
eks_cibr_block_rt02 = "0.0.0.0/0"
eks_vgw_id = "vgw-07f320a1394e25946"

eks_network_tags = {
        TechContact = "dl_cloudengineering@kinsaleins.com"
        Application = "eks_network"
        Component = "eks_network "
        Environment = "qa"    
}

eks-subnets = [
    module.eks-network.eks-network-01,
    module.eks-network.eks-network-02,
    module.eks-network.eks-network-03, 
    module.eks-network.eks-network-04,  
    module.eks-network.eks-network-05 ]



### EKS KMS ###

kms_tags = {
    TechContact = "dl_cloudengineering@kinsaleins.com"
    Application = "eks-cluster"
    Component = "eks-cluster"
    Environment = "qa"
}

kms_user_arn = "arn:aws:iam::210091639447:role/Kinsale-CICD-Generic"
kms_admin_arn = "arn:aws:iam::210091639447:role/kmir_AWS_kinsalenonprod_InfraOps"
kms_alias = "kinsale/EKS_Key_QA"
