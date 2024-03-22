variable "stack" {
  type        = string
  description = "Stack name"
  default     = "dev"
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


variable "cluster_endpoint" {
  sensitive   = true
  type        = string
  description = "Endpoint of the cluster."
}

variable "cluster_ca" {
  sensitive   = true
  type        = string
  description = "CA certificate of the cluster."
}

variable "k8s_exec_args" {
  type        = list(string)
  description = "Args for Kubernetes provider exec plugin. Example command ['eks', 'get-token', '--cluster-name', '{clusterName}}']"
}

variable "k8s_exec_command" {
  type        = string
  description = "Command name for Kubernetes provider exec plugin. Example - 'aws"
}