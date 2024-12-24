# EC2 Instance
resource "aws_instance" "tf_aws_ec2_instance" {
  ami                    = "ami-07d9cf938edb0739b" # Replace with your desired AMI ID
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.tf_aws_sn2a.id
  key_name               = "id_rsa"
  vpc_security_group_ids = ["tf_aws_sg22"]


  tags = {
    Name = "tf_aws_ec2_instance"
  }
}

output "instance_id" {
  value = aws_instance.tf_aws_ec2_instance.id
}

output "instance_public_ip" {
  value = aws_instance.tf_aws_ec2_instance.public_ip
}
