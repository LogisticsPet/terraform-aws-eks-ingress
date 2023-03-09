locals {
  lb_name = "${var.stack}-lb-${random_string.lb_suffix.result}"
}

resource "random_string" "lb_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "helm_release" "aws_lb_controller" {
  name              = "aws-load-balancer-controller"
  repository        = "https://aws.github.io/eks-charts"
  chart             = "aws-load-balancer-controller"
  namespace         = var.namespace
  atomic            = true
  dependency_update = true
  verify            = false

  values = [
    yamlencode({
      fullnameOverride = "aws-lb-controller"
      clusterName      = var.cluster_name
      region           = data.aws_region.current.name
      serviceAccount = {
        create = false
        name   = kubernetes_service_account.service-account.metadata[0].name
      }
    })
  ]
}

resource "helm_release" "nginx_ingress_controller" {
  depends_on        = [helm_release.aws_lb_controller]
  name              = "nginx-ingress-controller"
  repository        = "https://kubernetes.github.io/ingress-nginx"
  chart             = "ingress-nginx"
  version           = var.chart_version
  namespace         = var.namespace
  atomic            = true
  dependency_update = true
  verify            = false

  values = [
    yamlencode({
      fullnameOverride = "nginx-ingress"
      controller = {
        kind = var.nginx_ingress_kind
        extraArgs = {
          enable-ssl-passthrough = "true"
        }
        service = {
          annotations = {
            "service.beta.kubernetes.io/aws-load-balancer-name"            = local.lb_name
            "service.beta.kubernetes.io/aws-load-balancer-proxy-protocol"  = "*"
            "service.beta.kubernetes.io/aws-load-balancer-type"            = "nlb-ip"
            "service.beta.kubernetes.io/aws-load-balancer-nlb-target-type" = "ip"
            "service.beta.kubernetes.io/aws-load-balancer-scheme"          = "internet-facing"
          }
        }
      }
    })
  ]
}
