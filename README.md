# mo-bh-assesment

MarvelOrange Blue Harvest Devops Assesment

## Terraform

1. VPC
2. ECR
3. DB
4. S3 - Artifacts
5. S3 - LB logs
6. ECS - FARGATE
7. ALB Cert
8. ALB

## Workflows

### Springboot workflow

1. Build and artifact JAR
2. Scan JAR for vulnerabilities
3. Build docker image with tag
4. Push docker image to ECR
5. Report back for image scanning, fail if any critical/high findings
6. Create ECS deployment for ECS service

### dotnet workflow

1. Build validation
2. Build and test
3. Publish app
4. Scan code for vulnerabilities
5. Build docker image with tag
6. Push docker image to ECR
7. Report back for image scanning, fail if any critical/high findings
8. Create ECS deployment for ECS service
