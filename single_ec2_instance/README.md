# Using Terraform to spin up single EC2 instance
## Let's start with the basics

First, we create a VPC in us-west-2a (Oregon) region, a subnet within Availability Zone (AZ) us-west-2a, create an Internet Gateway and attach that to the VPC, create a route table that is then associated with the subnet and that is provided a route that points to the IG for public access (so that we can SSH into it).

We also need to create a security group that will allow for incoming on port 22 - this will be attached to the EC2 instance spun up within this us-west-2a AZ and subnet. 
