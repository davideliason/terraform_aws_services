# Using Optimal Directory Setup for AWS Serivces Using TF
## Creating an EC2 instance within the supporting infrastructure using:
### main.tf, variables.tf, outputs.tf and modules structure

This modularity decouples hard-coded variables and allows extensibility and potential incorporation into other automation tools.
Might as well learn to use TF the right way!

**Resources created:**
VPC, public and private subnets, NAT gateway, security group allowing port 80 and 22 access from anywhere, t2.micro EC2 instance with key-pair for SSH access.

![Screenshot 2024-12-25 at 7 45 59 AM](https://github.com/user-attachments/assets/21363a08-c345-475e-b14f-758a229cf807)
