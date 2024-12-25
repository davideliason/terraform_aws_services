variable "vpc_name" {}
variable "cidr" {}
variable "azs" { default = [] }
variable "public_subnets" { default = [] }
variable "private_subnets" { default = [] }
variable "tags" { default = {} }
