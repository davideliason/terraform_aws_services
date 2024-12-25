aws s3api create-bucket --bucket david-eliason-my-terraform-state-bucket-number2 --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2
aws s3api put-bucket-versioning --bucket my-terraform-state-bucket --versioning-configuration Status=Enabled

aws dynamodb create-table --table-name terraform-lock-table \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST

