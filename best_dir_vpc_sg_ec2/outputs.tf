output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instance_public_ip" {
  value = module.ec2.ec2_public_ip
}

