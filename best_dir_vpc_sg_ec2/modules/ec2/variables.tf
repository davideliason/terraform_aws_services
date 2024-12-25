variable "ami" {
  description = "The Amazon Machine Image (AMI) ID to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "The name tag for the EC2 instance."
  type        = string
  default     = "terraform-ec2"
}
variable "subnet_id" {}
variable "security_group_id" {}

variable "allowed_ssh_cidrs" {
  description = "List of CIDR blocks allowed to SSH into the instance."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "tags" { default = {} }
variable "key_name" {
  description = "The name of the key pair to allow ssh access"
  type        = string
}
