data "aws_cloudformation_export" "sg_id_default" {
    name = var.sg_default
}

data "aws_cloudformation_export" "sg_id_second" {
    name = var.sg_second
}


data "terraform_remote_state" "eks-iam" {
    backend = "s3"
    config = {
        bucket = var.iam-data-bucket
        key = var.iam-data-key
        region = var.iam-data-region
    }
}

module "eks-cluster" {
    source = "./modules/eks-cluster"
    key_arn = module.eks-kms.key_arn
    name = var.eks-cluster-name
    tags = var.eks-cluster-tags
    eks-subnets = [module.eks_network.eks-network-01,
    module.eks_network.eks-network-02,
    module.eks_network.eks-network-03, 
    module.eks_network.eks-network-04,  
    module.eks_network.eks-network-05]
    cluster-version = var.cluster-version
    iam-data-bucket = var.iam-data-bucket
    iam-data-key = var.iam-data-key 
    iam-data-region = var.iam-data-region 
    cluster-sg = [module.eks-sg.eks-sg-id, data.aws_cloudformation_export.sg_id_default.value, data.aws_cloudformation_export.sg_id_second.value]

    depends_on = [
        module.eks-sg,
        module.eks-kms
    ]
}

module "eks-sg" {
    source = "./modules/eks-sg"
    sg-name = var.sg-name
    cidr_blocks = var.cidr_blocks
    cidr_blocks_2 = var.cidr_blocks_2
    cidr_blocks_3 = var.cidr_blocks_3
    cidr_blocks_4 = var.cidr_blocks_4
    vpc_id = var.vpc_id
    eks-sg-tags = var.eks-sg-tags
}

module "eks-nodegroup" {
    source = "./modules/eks-nodegroup"
    eks-subnets = [module.eks_network.eks-network-01,
    module.eks_network.eks-network-02,
    module.eks_network.eks-network-03, 
    module.eks_network.eks-network-04,  
    module.eks_network.eks-network-05]
    eks-nodes-min-size = var.eks-nodes-min-size
    eks-nodes-max-size = var.eks-nodes-max-size
    eks-nodes-desired-size = var.eks-nodes-desired-size
    node-group-name = var.node-group-name
    cluster-version = var.cluster-version
    eks-nodegroup-capacity-type = var.eks-nodegroup-capacity-type
    eks-nodegroup-instance-types = var.eks-nodegroup-instance-types
    eks-nodegroup-disk-size = var.eks-nodegroup-disk-size
    eks-nodegroup-labels = var.eks-nodegroup-labels
    eks-nodegroup-tags = var.eks-nodegroup-tags
    iam-data-bucket = var.iam-data-bucket
    iam-data-key = var.iam-data-key 
    iam-data-region = var.iam-data-region 
    cluster-name = module.eks-cluster.eks-cluster-name



    depends_on = [
        module.eks-sg,
        module.eks-cluster
    ]
}
######## Node Group 2
#module "eks-nodegroup-second" {
#    source = "./modules/eks-nodegroup"
#    eks-subnets = [module.eks_network.eks-network-01,
#    module.eks_network.eks-network-02,
#    module.eks_network.eks-network-03, 
#    module.eks_network.eks-network-04,  
#    module.eks_network.eks-network-05]
#    eks-nodes-min-size = var.eks-nodes-min-size
#    eks-nodes-max-size = var.eks-nodes-max-size
#    eks-nodes-desired-size = var.eks-nodes-desired-size
#    node-group-name = var.node_second_group_name
#    cluster-version = var.cluster-version
#    eks-nodegroup-capacity-type = var.eks-nodegroup-capacity-type
#    eks-nodegroup-instance-types = var.eks-nodegroup-instance-types
#    eks-nodegroup-disk-size = var.eks-nodegroup-disk-size
#    eks-nodegroup-labels = var.eks-nodegroup-labels
#    eks-nodegroup-tags = var.eks-nodegroup-tags
#    iam-data-bucket = var.iam-data-bucket
#    iam-data-key = var.iam-data-key 
#    iam-data-region = var.iam-data-region 
#    cluster-name = module.eks-cluster.eks-cluster-name
#
#    depends_on = [
#        module.eks-sg,
#        module.eks-cluster
#    ]
#}

module "eks_network" {
   source = "./modules/eks-network"
   eks_vpc_id = var.vpc_id
   eks_cibr_block_sn01 = var.eks_cibr_block_sn01
   eks_cibr_block_sn02 = var.eks_cibr_block_sn02
   eks_cibr_block_sn03 = var.eks_cibr_block_sn03
   eks_cibr_block_sn04 = var.eks_cibr_block_sn04
   eks_cibr_block_sn05 = var.eks_cibr_block_sn05
   eks_cibr_block_rt01 = var.eks_cibr_block_rt01
   eks_cibr_block_rt02 = var.eks_cibr_block_rt02
   eks_vgw_id = var.eks_vgw_id
   tags = var.eks_network_tags
}

module "eks-kms" {
    source           = "./modules/eks-kms"
    kms_user_arn         = var.kms_user_arn
    kms_admin_arn        = var.kms_admin_arn
    key_spec         = var.kms_key_spec
    enabled          = var.kms_enabled
    rotation_enabled = var.kms_rotation_enabled
    kms_alias        = var.kms_alias
    tags             = var.kms_tags
}
