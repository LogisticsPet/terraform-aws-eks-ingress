variable "region" {}

variable "stack" {
  description = "Stack name"
}

variable "nginx_ingress_namespace" {
  description = "Namespace where nginx ingress will be deployed to"
  default     = "nginx-ingress"
}

variable "domain" {
  type        = string
  description = "Root application domain name"
}

variable "nginx_ingress_kind" {
  description = "Kind of Nginx ingress controller. Can be Deployment/DaemonSet"
  default     = "Deployment"
}