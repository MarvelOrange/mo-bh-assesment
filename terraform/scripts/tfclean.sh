git_repo=$(git rev-parse --show-toplevel)
terraform_path="$git_repo/terraform"

rm -rf $terraform_path/.terraform/
echo "Deleting -- $terraform_path/.terraform/"

rm -rf $terraform_path/.*.lock.hcl
echo "Deleting -- $terraform_path/.*.lock.hcl"

rm -rf $terraform_path/*.out
echo "Deleting -- $terraform_path/*.out"

rm -rf $terraform_path/*.out.json
echo "Deleting -- $terraform_path/*.out.json"