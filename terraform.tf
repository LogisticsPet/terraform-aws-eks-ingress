terraform {
  required_version = "1.7.5"
  required_providers {
    aws = {
      version = "5.40.0"
      source  = "hashicorp/aws"
    }
    kubernetes = {
      version = "2.18.1"
      source  = "hashicorp/kubernetes"
    }
    helm = {
      version = "2.12.1"
      source  = "hashicorp/helm"
    }
    random = {
      version = "3.4.3"
      source  = "hashicorp/random"
    }
  }
}
