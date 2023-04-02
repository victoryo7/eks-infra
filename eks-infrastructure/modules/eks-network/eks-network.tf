# Subnet creation

resource "aws_subnet" "eks_private_sn01" {
    vpc_id = var.eks_vpc_id
    cidr_block = var.eks_cibr_block_sn01
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1a"
    tags = var.tags
}

resource "aws_subnet" "eks_private_sn02" {
    vpc_id = var.eks_vpc_id
    cidr_block = var.eks_cibr_block_sn02
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1b"
    tags = var.tags
}

resource "aws_subnet" "eks_private_sn03" {
    vpc_id = var.eks_vpc_id
    cidr_block = var.eks_cibr_block_sn03
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1c"
    tags = var.tags
}

resource "aws_subnet" "eks_private_sn04" {
    vpc_id = var.eks_vpc_id
    cidr_block = var.eks_cibr_block_sn04
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1d"
    tags = var.tags
}

resource "aws_subnet" "eks_private_sn05" {
    vpc_id = var.eks_vpc_id
    cidr_block = var.eks_cibr_block_sn05
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1f"
    tags = var.tags
}

# Route Table creation

resource "aws_route_table" "eks_private_rt" {
    vpc_id = var.eks_vpc_id
    route {
        cidr_block = var.eks_cibr_block_rt02
        gateway_id = var.eks_vgw_id
    }
    tags = var.tags
}

# Route association 

resource "aws_route_table_association" "dev_eks_rtassoc1" {
    subnet_id = "${aws_subnet.eks_private_sn01.id}"
    route_table_id = "${aws_route_table.eks_private_rt.id}"
    depends_on = [
        aws_subnet.eks_private_sn01,
        aws_route_table.eks_private_rt
    ]
}

resource "aws_route_table_association" "dev_eks_rtassoc2" {
    subnet_id = "${aws_subnet.eks_private_sn02.id}"
    route_table_id = "${aws_route_table.eks_private_rt.id}"
    depends_on = [
        aws_subnet.eks_private_sn02,
        aws_route_table.eks_private_rt
    ]
}

resource "aws_route_table_association" "dev_eks_rtassoc3" {
    subnet_id = "${aws_subnet.eks_private_sn03.id}"
    route_table_id = "${aws_route_table.eks_private_rt.id}"
    depends_on = [
        aws_subnet.eks_private_sn03,
        aws_route_table.eks_private_rt
    ]
}

resource "aws_route_table_association" "dev_eks_rtassoc4" {
    subnet_id = "${aws_subnet.eks_private_sn04.id}"
    route_table_id = "${aws_route_table.eks_private_rt.id}"
    depends_on = [
        aws_subnet.eks_private_sn04,
        aws_route_table.eks_private_rt
    ]
}

resource "aws_route_table_association" "dev_eks_rtassoc5" {
    subnet_id = "${aws_subnet.eks_private_sn05.id}"
    route_table_id = "${aws_route_table.eks_private_rt.id}"
    depends_on = [
        aws_subnet.eks_private_sn05,
        aws_route_table.eks_private_rt
    ]
}

