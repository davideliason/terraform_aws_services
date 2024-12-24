# Create a VPC
# resource "aws_vpc" "example" {
# cidr_block = "10.0.0.0/16"
#}

resource "aws_vpc" "tf_aws_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "tf_aws_vpc_mask16"
  }
}

resource "aws_subnet" "tf_aws_sn2a" {
  vpc_id            = aws_vpc.tf_aws_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.tf_aws_vpc.cidr_block, 3, 1)
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf_aws_sn_uswest2a"
  }
}

# IG
resource "aws_internet_gateway" "tf_aws_ig" {
  vpc_id = aws_vpc.tf_aws_vpc.id

  tags = {
    Name = "tf_aws_ig"
  }
}

resource "aws_route_table" "tf_aws_rt2a" {
  vpc_id = aws_vpc.tf_aws_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_aws_ig.id
  }

  tags = {
    Name = "tf_aws_rt2a"
  }
}

resource "aws_route_table_association" "tf_aws_rt2a" {
  subnet_id      = aws_subnet.tf_aws_sn2a.id
  route_table_id = aws_route_table.tf_aws_rt2a.id
}

resource "aws_security_group" "tf_aws_sg22" {
  name        = "allow-all-ssh"
  description = "Allow all inbound traffic from port 22"
  vpc_id      = aws_vpc.tf_aws_vpc.id

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
    Name = "tf_aws_sg_allowSSH"
  }
}


