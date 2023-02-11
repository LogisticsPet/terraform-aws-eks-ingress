data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.stack}-vpc"]
  }
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

data "aws_eks_cluster" "eks_cluster" {
  name = "${var.stack}-eks"
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = "${var.stack}-eks"
}