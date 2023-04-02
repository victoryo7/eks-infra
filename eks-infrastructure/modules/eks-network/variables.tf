variable "eks_vpc_id" {
    type = string
}

variable  "eks_cibr_block_sn01" {
    type = string
}

variable  "eks_cibr_block_sn02" {
    type = string
}

variable  "eks_cibr_block_sn03" {
    type = string
}

variable  "eks_cibr_block_sn04" {
    type = string
}

variable  "eks_cibr_block_sn05" {
    type = string
}

variable "eks_cibr_block_rt01" {
    type = string
}

variable "eks_cibr_block_rt02" {
    type = string
}

variable  "eks_vgw_id" {
    type = string
}

variable "tags" {
    type = object({
        TechContact = string
        Application = string
        Component = string
        Environment = string
    })
}
