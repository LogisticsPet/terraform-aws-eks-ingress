locals {
  cluster_name = "${var.stack}-eks"
}

data "aws_acm_certificate" "acm_certificate" {
  domain = "*.${var.domain}"
}

data "aws_eks_cluster" "eks_cluster" {
  name = local.cluster_name
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = local.cluster_name
}
