module "helm" {
  source = "./helm"

  tfe_organization        = var.tfe_organization
  tfe_eks_workspace_name  = var.tfe_eks_workspace_name
  region                  = var.region
  stack                   = var.stack
  nginx_ingress_name      = var.nginx_ingress_name
  nginx_ingress_namespace = var.nginx_ingress_namespace
  ingress_node_port       = var.ingress_node_port
}

module "lb" {
  depends_on = [module.helm]
  source     = "./lb"

  stack                   = var.stack
  domain                  = var.domain
  nginx_ingress_name      = var.nginx_ingress_name
  nginx_ingress_namespace = var.nginx_ingress_namespace
  ingress_node_port       = var.ingress_node_port
  public_subnet_tags      = var.public_subnet_tags
}