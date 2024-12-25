module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = "my-vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  tags            = { Environment = "dev" }
}

module "security_group" {
  source = "./modules/security-group"
  name   = "web-sg"
  vpc_id = module.vpc.vpc_id
  tags   = { Environment = "dev" }
}

module "ec2" {
  source            = "./modules/ec2"
  ami               = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.public_subnets[0]
  security_group_id = module.security_group.security_group_id
  tags              = { Environment = "dev" }
}
