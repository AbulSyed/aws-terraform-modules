module "ecr" {
  source  = "./modules/ecr"
  name    = "template"
  service = "template"
  env     = "dev"
}
