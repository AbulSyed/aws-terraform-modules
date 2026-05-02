# AWS Terraform Modules

### Terraform state file / Remote backend

Terraform state file is stored in AWS S3. Since state files contains sensitive info it should never be stored in version control systems. S3 also provides state locking which prevents concurrent modifications.

- `bootstrap-backend.tf` - creation of S3 with versioning, encryption & blocking public access.
- `backend.tf` - configuring terraform to use S3 as remote backend

### ECR

Docker images are stored in AWS ECR.
