resource "kubernetes_ingress" "devpi" {
  metadata {
    name = "devpi"
    namespace = kubernetes_namespace.namespace.metadata[0].name
    annotations = {
      "kubernetes.io/ingress.global-static-ip-name" = local.values.public_ip
      "networking.gke.io/managed-certificates" = local.values.hostname
    }
    labels = {
      app = "devpi"
      stack = "kubernetes"
    }
  }
  spec {
    rule {
      host = local.values.hostname
      http {
        path {
          backend {
            service_name = kubernetes_service.devpi.metadata[0].name
            service_port = "80"
          }
          path = "/*"
        }
      }
    }
  }

  depends_on = [
    kubernetes_stateful_set.devpi,
    null_resource.managedcertificate,
    kubernetes_service.devpi]
}