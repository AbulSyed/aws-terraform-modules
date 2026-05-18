resource "aws_ecr_repository" "ecr" {
  name = var.name

  # AWS scans the image for known CVEs/security vulnerabilities.
  image_scanning_configuration {
    scan_on_push = true
  }

  # For development, to allow terraform to delete all images in repo & then the repo itself
  force_delete = true

  tags = {
    Service     = var.service
    Environment = var.env
  }
}
