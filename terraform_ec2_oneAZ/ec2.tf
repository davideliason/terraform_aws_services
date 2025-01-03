
# Create an EC2 Instance
resource "aws_instance" "Project1_ec2" {
  ami                         = "ami-07d9cf938edb0739b" # Replace with your desired AMI
  instance_type               = var.instance_type       # Replace with your desired instance type
  subnet_id                   = aws_subnet.project1_subnet_us_west_2a.id
  vpc_security_group_ids      = [aws_security_group.project1_sg_port22.id]
  key_name                    = aws_key_pair.Project1_key_pair.key_name
  associate_public_ip_address = true # Explicitly assign public IP

  tags = {
    Name = "Project1EC2_2a"
  }
}

# Key Pair
resource "aws_key_pair" "Project1_key_pair" {
  key_name   = "Project1_key_pair"       # Replace with your desired key pair name
  public_key = file("~/.ssh/id_rsa.pub") # Path to your public key
}

