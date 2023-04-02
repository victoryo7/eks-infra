variable "eks-subnets" {
    type = list(string)
}

variable "eks-nodes-min-size" {
    type = string
}

variable "eks-nodes-max-size" {
    type = string
}

variable "eks-nodes-desired-size" {
    type = string
}

variable "node-group-name" {
    type = string
}

variable "eks-nodegroup-capacity-type" {
    type = string
}

variable "eks-nodegroup-disk-size" {
    type = string
}

variable "eks-nodegroup-instance-types" {
    type = list(string)
}

variable "eks-nodegroup-labels" {
    type = map(string)
}

variable "eks-nodegroup-tags" {
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

variable "cluster-name" {
    type = string
}
