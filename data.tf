data "aws_lb_target_group" "ingress-tg-https" {
  depends_on = [module.alb]
  name       = "${var.stack}-ingress-tg-https"
}

data "kubernetes_service" "nginx_ingress_service" {
  depends_on = [helm_release.nginx_ingress_controller]
  metadata {
    name      = "${local.nginx_ingress_name}-controller"
    namespace = "kube-system"
  }
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.stack}-vpc"]
  }
}

data "aws_subnets" "lb_subnets" {
  tags = var.public_subnet_tags
}

data "aws_acm_certificate" "acm_certificate" {
  domain = var.domain
}

data "terraform_remote_state" "eks" {
  backend = "remote"

  config = {
    organization = var.tfe_organization
    workspaces = {
      name = var.tfe_eks_workspace_name
    }
  }
}
