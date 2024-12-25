# Create a VPC
# resource "aws_vpc" "example" {
# cidr_block = "10.0.0.0/16"
#}

resource "aws_vpc" "project1_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Project1VPC"
  }
}
#
resource "aws_subnet" "project1_subnet_us_west_2a" {
  vpc_id                  = aws_vpc.project1_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.project1_vpc.cidr_block, 3, 1)
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Project1SubnetUSWest2a"
  }
}


# IG
resource "aws_internet_gateway" "project1_ig" {
  vpc_id = aws_vpc.project1_vpc.id

  tags = {
    Name = "project1VPC"
  }
}

resource "aws_route_table" "project1_rt_2a" {
  vpc_id = aws_vpc.project1_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project1_ig.id
  }

  tags = {
    Name = "Project1RT2a"
  }
}

resource "aws_route_table_association" "project1_rt_2a_association" {
  subnet_id      = aws_subnet.project1_subnet_us_west_2a.id
  route_table_id = aws_route_table.project1_rt_2a.id
}

resource "aws_security_group" "project1_sg_port22" {
  name        = "project1_sg_port22"
  description = "Allow all inbound traffic from port 22"
  vpc_id      = aws_vpc.project1_vpc.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "project1_sg_port22"
  }
}

# Outputs
output "vpc_id" {
  value = aws_vpc.project1_vpc.id
}

output "subnet_id" {
  value = aws_subnet.project1_subnet_us_west_2a.id
}

output "security_group_id" {
  value = aws_security_group.project1_sg_port22.id
}

output "instance_id" {
  value = aws_instance.Project1_ec2.id
}

output "instance_public_ip" {
  value = aws_instance.Project1_ec2.public_ip
}

terraform {
  backend "s3" {
    bucket         = "david-eliason-my-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terraform-lock-table" # Optional for state locking
  }
}
