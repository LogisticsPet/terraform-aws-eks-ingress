resource "kubernetes_namespace" "nginx_ingress" {
  metadata {
    name = var.nginx_ingress_namespace
  }
}

resource "helm_release" "nginx_ingress_controller" {
  name              = "nginx-ingress-controller"
  repository        = "https://kubernetes.github.io/ingress-nginx"
  chart             = "ingress-nginx"
  namespace         = kubernetes_namespace.nginx_ingress.metadata[0].name
  atomic            = true
  dependency_update = true
  verify            = false

  values = [
    yamlencode({
      fullnameOverride = "nginx-ingress"
      controller = {
        kind = var.nginx_ingress_kind
        service = {
          targetPorts = {
            https = "80"
          }
          annotations = {
            "service.beta.kubernetes.io/aws-load-balancer-backend-protocol"         = "http"
            "service.beta.kubernetes.io/aws-load-balancer-proxy-protocol"           = "*"
            "service.beta.kubernetes.io/aws-load-balancer-ssl-cert"                 = data.aws_acm_certificate.acm_certificate.arn
            "service.beta.kubernetes.io/aws-load-balancer-ssl-ports"                = "443"
            "service.beta.kubernetes.io/aws-load-balancer-type"                     = "nlb"
            "service.beta.kubernetes.io/aws-load-balancer-nlb-target-type"          = "ip"
            "service.beta.kubernetes.io/aws-load-balancer-ip-address-type"          = "ipv4"
            "service.beta.kubernetes.io/aws-load-balancer-scheme"                   = "internet-facing"
            "service.beta.kubernetes.io/aws-load-balancer-additional-resource-tags" = "Name=${var.stack}-lb"
          }

          #          https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.3/guide/service/annotations/
        }
      }
    })
  ]
}
