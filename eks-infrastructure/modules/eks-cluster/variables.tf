variable "name" {
    type = string 
}

variable "eks-subnets" {
    type = list(string)
}

variable "tags" {
    type = object({
        TechContact = string
        Application = string
        Component = string
        Environment = string
    })
}

variable "cluster-version" {
    type = string
}

variable "iam-data-key" {
    type = string
}

variable "iam-data-bucket" {
    type = string
}

variable "iam-data-region" {
    type = string
}

variable "cluster-sg" {
    type = list(any)
}

variable "key_arn" {
    type = string
}
