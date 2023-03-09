data "aws_eks_cluster" "eks_cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = var.cluster_name
}

data "aws_region" "current" {}

data "aws_lb" "lb" {
  depends_on = [helm_release.nginx_ingress_controller]
  name       = local.lb_name
}
