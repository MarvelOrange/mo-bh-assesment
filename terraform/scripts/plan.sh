env_name=$1

AWS_TF_STATE_BUCKET_REGION=$(aws s3api get-bucket-location --bucket 522642610479-eu-north-1-tf-state --query 'LocationConstraint' --output text)
AWS_TF_STATE_PATH=$(echo "mh/aws/terraform/mo-bh-assesment/522642610479/dev/terraform.tfstate" | tr '[:upper:]' '[:lower:]')

terraform_1.6.6 init \
  -backend-config "bucket=522642610479-eu-north-1-tf-state" \
  -backend-config "region=$AWS_TF_STATE_BUCKET_REGION" \
  -backend-config "key=$AWS_TF_STATE_PATH" \
  -backend-config "encrypt=true"

terraform_1.6.6 plan -out mo-bh-assesment-$env_name.out -var-file=./env/$env_name.tfvars
