variable "region" {}

variable "stack" {
  description = "stack name"
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
}

variable "domain" {
  type        = string
  description = "Root application domain name"
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