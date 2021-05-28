terraform {
  required_version = ">= 0.15.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.42.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.2.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.1.2"
    }
  }
}
