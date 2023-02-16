data "aws_acm_certificate" "acm_certificate" {
  domain = var.domain
}

data "aws_eks_cluster" "eks_cluster" {
  name = "${var.stack}-eks"
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = "${var.stack}-eks"
}