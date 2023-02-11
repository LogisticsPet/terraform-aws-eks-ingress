resource "helm_release" "nginx_ingress_controller" {
  name              = "nginx-ingress-controller"
  repository        = "https://kubernetes.github.io/ingress-nginx"
  chart             = "ingress-nginx"
  namespace         = var.nginx_ingress_namespace
  atomic            = true
  dependency_update = true
  verify            = false

  depends_on = [
    kubernetes_service_account.service-account
  ]

  values = [
    yamlencode({
      fullnameOverride = var.nginx_ingress_name
      controller = {
        service = {
          type = "NodePort"
          nodePorts = {
            "http" : var.ingress_node_port
          }
        }
      }
    })
  ]
}
