terraform {
  required_version = "1.10.2"
  required_providers {
    aws = {
      version = "5.81.0"
      source  = "hashicorp/aws"
    }
    kubernetes = {
      version = "2.35.0"
      source  = "hashicorp/kubernetes"
    }
    helm = {
      version = "2.12.1"
      source  = "hashicorp/helm"
    }
    random = {
      version = "3.6.3"
      source  = "hashicorp/random"
    }
  }
}
