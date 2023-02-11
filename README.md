## Introduction
Terraform module to install AWS and NGINX ingress controllers

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.54.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.8.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.17.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |

## Resources

| Name | Type |
|------|------|
| [helm_release.aws_lb_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.nginx_ingress_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.eks_cluster_auth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [terraform_remote_state.eks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ingress_node_port"></a> [ingress\_node\_port](#input\_ingress\_node\_port) | Node port of nginx ingress for NLB to proxy traffic to | `any` | n/a | yes |
| <a name="input_nginx_ingress_namespace"></a> [nginx\_ingress\_namespace](#input\_nginx\_ingress\_namespace) | Namespace where nginx ingress will be deployed to | `any` | n/a | yes |
| <a name="input_nginx_ingress_service_name"></a> [nginx\_ingress\_service\_name](#input\_nginx\_ingress\_service\_name) | Nginx ingress service name | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_stack"></a> [stack](#input\_stack) | Stack name | `any` | n/a | yes |
| <a name="input_tfe_eks_workspace_name"></a> [tfe\_eks\_workspace\_name](#input\_tfe\_eks\_workspace\_name) | n/a | `string` | `"Name of Terraform Cloud eks workspace"` | no |
| <a name="input_tfe_organization"></a> [tfe\_organization](#input\_tfe\_organization) | n/a | `string` | `"Name of Terraform Cloud organization"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->