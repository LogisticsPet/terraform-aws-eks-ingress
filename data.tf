data "aws_eks_cluster" "eks_cluster" {
  name = "${var.stack}-eks"
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = "${var.stack}-eks"
}