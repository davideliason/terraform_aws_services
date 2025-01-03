module "vpc" { # values are assigned when calling the module
  source          = "./modules/vpc"
  vpc_name        = "my-vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["us-west-2a", "us-west-2b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  tags = {
    Environment = "dev"
    Project     = "vpc-project"
  }
}

module "security_group" {
  source = "./modules/security-group"
  name   = "web-sg"
  vpc_id = module.vpc.vpc_id
  tags   = { Environment = "dev" }
}

module "ec2" {
  source            = "./modules/ec2"
  ami               = "ami-07d9cf938edb0739b"
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.public_subnets[0]
  security_group_id = module.security_group.security_group_id
  tags              = { Environment = "dev" }
  key_name          = "best_dir"
  allowed_ssh_cidrs = ["0.0.0.0/0"]
}
