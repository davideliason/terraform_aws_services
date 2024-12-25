
# Create an EC2 Instance
resource "aws_instance" "Project1_ec2" {
  ami                    = "ami-07d9cf938edb0739b" # Replace with your desired AMI
  instance_type          = "t2.micro"              # Replace with your desired instance type
  subnet_id              = aws_subnet.project1_subnet_us_west_2a.id
  vpc_security_group_ids = [aws_security_group.project1_sg_port22.id]
  key_name               = "KeyPair"

  tags = {
    Name = "Project1EC2_2a"
  }
}

