variable "stack" {
  type        = string
  description = "Stack name"
}

variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster"
}

variable "nginx_ingress_namespace" {
  type        = string
  description = "Namespace where nginx ingress will be deployed to"
  default     = "nginx-ingress"
}

variable "domain" {
  type        = string
  description = "Root application domain name"
}

variable "nginx_ingress_kind" {
  type        = string
  description = "Kind of Nginx ingress controller"
  default     = "DaemonSet"

  validation {
    condition     = contains(["Deployment", "DaemonSet"], var.nginx_ingress_kind)
    error_message = "Kind can be either Deployment or DaemonSet"
  }
}
