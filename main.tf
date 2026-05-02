module "ecr" {
  source  = "./modules/ecr"
  name    = "example"
  service = "example"
  env     = "dev"
}
