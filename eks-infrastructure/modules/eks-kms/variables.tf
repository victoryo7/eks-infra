
variable "kms_user_arn" {
  type = string
}

variable "kms_admin_arn" {
  type = string
}

variable "key_spec" {
  type = string
  default = "SYMMETRIC_DEFAULT"
}

variable "enabled" {
  default = true
}

variable "rotation_enabled" {
  default = true
}


variable "kms_alias" {
   type = string
   #default = "kinsale/EKS_Key"
}


variable "tags" {
   type = object({
       TechContact = string 
       Application = string
       Component = string
       Environment = string
   })
}
