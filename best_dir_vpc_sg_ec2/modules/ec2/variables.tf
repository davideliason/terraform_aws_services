variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_id" {}
variable "tags" { default = {} }
variable "key_name" {
  description = "The name of the key pair to allow ssh access"
  type        = string
}
