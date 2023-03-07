variable "stack" {
  type        = string
  description = "Stack name"
  default     = "dev"
}

variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster"
}

variable "namespace" {
  type        = string
  description = "Namespace where nginx ingress and AWS LB Controller will be deployed to"
}

variable "nginx_ingress_kind" {
  type        = string
  description = "Kind of Nginx ingress controller"
  default     = "Deployment"

  validation {
    condition     = contains(["Deployment", "DaemonSet"], var.nginx_ingress_kind)
    error_message = "Kind can be either Deployment or DaemonSet"
  }
}

variable "oidc_provider_arn" {
  type        = string
  description = "OIDC provider arn"
}

variable "chart_version" {
  type    = string
  default = "4.2.5"
}
