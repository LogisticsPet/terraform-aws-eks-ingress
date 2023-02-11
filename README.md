## Introduction
Terraform module to install AWS and NGINX ingress controllers, expose nginx ingress on NodePort and attach an NLB for this port.

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
| <a name="module_alb"></a> [alb](#module\_alb) | terraform-aws-modules/alb/aws | ~> 8.0 |
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |

## Resources

| Name | Type |
|------|------|
| [helm_release.aws_lb_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.nginx_ingress_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_manifest.ingress-binding](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_service_account.service-account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [aws_acm_certificate.acm_certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |
| [aws_lb_target_group.ingress-tg-https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lb_target_group) | data source |
| [aws_subnets.lb_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [kubernetes_service.nginx_ingress_service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service) | data source |
| [terraform_remote_state.eks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Root application domain name | `string` | n/a | yes |
| <a name="input_ingress_node_port"></a> [ingress\_node\_port](#input\_ingress\_node\_port) | Node port of nginx ingress for NLB to proxy traffic to | `any` | n/a | yes |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | Additional tags for the public subnets | `map(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_stack"></a> [stack](#input\_stack) | stack name | `any` | n/a | yes |
| <a name="input_tfe_eks_workspace_name"></a> [tfe\_eks\_workspace\_name](#input\_tfe\_eks\_workspace\_name) | n/a | `string` | `"Name of Terraform Cloud eks workspace"` | no |
| <a name="input_tfe_organization"></a> [tfe\_organization](#input\_tfe\_organization) | n/a | `string` | `"Name of Terraform Cloud organization"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->