# Create an EC2 Instance
resource "aws_instance" "tf_aws_ec2_2a" {
  ami                    = "ami-07d9cf938edb0739b" # Replace with your desired AMI
  instance_type          = "t2.micro"              # Replace with your desired instance type
  subnet_id              = aws_subnet.tf_aws_subnet_2a.id
  vpc_security_group_ids = [aws_security_group.tf_aws_sg_port22.id]

  tags = {
    Name = "tf_aws_ec2_us_w2a"
  }
}
