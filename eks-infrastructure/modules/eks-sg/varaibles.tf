variable "sg-name" {
    type = string
}

variable "eks-sg-tags" {
    type = object({
        TechContact = string
        Application = string
        Component = string
        Environment = string
    })
}

variable "vpc_id" {
    type = string
}

variable "cidr_blocks" {
    type = string
}

variable "cidr_blocks_2" {
    type = string
}

variable "cidr_blocks_3" {
    type = string
}

variable "cidr_blocks_4" {
    type = string
}