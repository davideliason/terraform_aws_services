# Provider Configuration: Specifies cloud providers (e.g., AWS, Azure, GCP).
# Resource Definitions: Defines infrastructure components like VMs, storage, networking, etc.
# Data Sources: Used to fetch information about existing resources.
# Module Calls: Calls reusable modules with input/output variables.
# Outputs: Exposes useful data after the infrastructure is created.



####----A fuller example to uses variables and modules-------####

provider "aws" {
  region = var.region
}

module "vpc" {
  source       = "./modules/vpc"
  cidr_block   = var.vpc_cidr
  environment  = var.environment
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}







####---------####

 Specify the provider
provider "aws" {
  region = "us-west-2" # Replace with your desired region
}

# Define an S3 bucket resource
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-example-bucket" # Replace with a unique bucket name
  acl    = "private"

  tags = {
    Environment = "Dev"
    Name        = "My Example Bucket"
  }
}

# Define an EC2 instance resource
resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}

# Define a security group
resource "aws_security_group" "example_sg" {
  name        = "example-security-group"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
