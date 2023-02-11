variable "region" {}

variable "stack" {
  description = "Stack name"
}

variable "ingress_node_port" {
  description = "Node port of nginx ingress for NLB to proxy traffic to"
}

variable "tfe_organization" {
  default = "Name of Terraform Cloud organization"
}

variable "tfe_eks_workspace_name" {
  default = "Name of Terraform Cloud eks workspace"
}

variable "nginx_ingress_namespace" {
  description = "Namespace where nginx ingress will be deployed to"
}

variable "nginx_ingress_service_name" {
  description = "Nginx ingress service name"
}