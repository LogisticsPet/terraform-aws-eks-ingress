variable "region" {}

variable "stack" {
  description = "stack name"
}

variable "ingress_node_port" {
  description = "Node port of nginx ingress for NLB to proxy traffic to"
}

variable "tfe_organization" {}

variable "tfe_eks_workspace_name" {}

variable "nginx_ingress_namespace" {}

variable "nginx_ingress_name" {}