env_name=$1
git_repo=$(git rev-parse --show-toplevel)

bash $git_repo/terraform/scripts/plan.sh $env_name

terraform_1.6.6 show -json mo-bh-assesment-$env_name.out > mo-bh-assesment-$env_name.out.json

infracost breakdown --show-skipped --path mo-bh-assesment-$env_name.out.json