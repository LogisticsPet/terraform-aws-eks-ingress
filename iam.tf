locals {
  sa_name = "aws-load-balancer-controller-sa"
}

module "lb_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.48.0"

  role_name                                                       = "${var.stack}_aws_lb_controller"
  attach_load_balancer_controller_policy                          = true
  attach_load_balancer_controller_targetgroup_binding_only_policy = true

  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["${var.namespace}:${local.sa_name}"]
    }
  }
}

resource "kubernetes_service_account" "service-account" {
  metadata {
    name      = local.sa_name
    namespace = var.namespace
    labels = {
      "app.kubernetes.io/name"      = "aws-load-balancer-controller"
      "app.kubernetes.io/component" = "controller"
    }
    annotations = {
      "eks.amazonaws.com/role-arn"               = module.lb_role.iam_role_arn
      "eks.amazonaws.com/sts-regional-endpoints" = "true"
    }
  }
}
