variable "vpc_name" {} # since no default given, this var is required- a value must be passed when calling the module or TF apply
variable "cidr" {}
variable "azs" { default = [] }
variable "public_subnets" { default = [] }
variable "private_subnets" { default = [] }
variable "tags" { default = {} }
