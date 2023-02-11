## Introduction
Terraform module to install AWS and NGINX ingress controllers, expose nginx ingress on NodePort and attach an NLB for this port.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.54.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_helm"></a> [helm](#module\_helm) | ./helm | n/a |
| <a name="module_lb"></a> [lb](#module\_lb) | ./lb | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.eks_cluster_auth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Root application domain name | `string` | n/a | yes |
| <a name="input_ingress_node_port"></a> [ingress\_node\_port](#input\_ingress\_node\_port) | Node port of nginx ingress for NLB to proxy traffic to | `any` | n/a | yes |
| <a name="input_nginx_ingress_name"></a> [nginx\_ingress\_name](#input\_nginx\_ingress\_name) | n/a | `string` | `"nginx-ingress"` | no |
| <a name="input_nginx_ingress_namespace"></a> [nginx\_ingress\_namespace](#input\_nginx\_ingress\_namespace) | n/a | `string` | `"kube-system"` | no |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | Additional tags for the public subnets | `map(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_stack"></a> [stack](#input\_stack) | stack name | `any` | n/a | yes |
| <a name="input_tfe_eks_workspace_name"></a> [tfe\_eks\_workspace\_name](#input\_tfe\_eks\_workspace\_name) | n/a | `string` | `"Name of Terraform Cloud eks workspace"` | no |
| <a name="input_tfe_organization"></a> [tfe\_organization](#input\_tfe\_organization) | n/a | `string` | `"Name of Terraform Cloud organization"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->