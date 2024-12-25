# EC2 Instance Creation in One AZ using Terraform
## David Eliason
### 12/24/2024

In this code, there were several iterations leading to the successful deployment of an EC2 instance that could be successfully SSH'd into. The supporting infrastructure (VPC, SG, IG, RT) were created successfully.

Added modification to align the initial structure to the best practices directory folder structure.
Created scripts folder, and within that, a script to create a Backend State via S3 bucket. I had to enable versioning via the Console.
This moved the state files to a central location re: S3 bucket, which enables collaboration. 

Sure enough, after $ terraform plan > $ terraform apply the .tfstate file is in the s3 bucket. Nice

<img width="1209" alt="Screenshot 2024-12-24 at 8 43 19 PM" src="https://github.com/user-attachments/assets/aec39489-2801-4fe4-b757-f9c8b71e2012" />
