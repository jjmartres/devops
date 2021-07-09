resource "kubernetes_service" "devpi" {
  metadata {
    name = "devpi"
    namespace = kubernetes_namespace.namespace.metadata[0].name
    labels = {
      app = "devpi"
      stack = "kubernetes"
    }
  }
  spec {
    port {
      name = "http"
      port = 80
      protocol = "TCP"
      target_port = "80"
    }
    selector = {
      app = "devpi"
      stack = "kubernetes"
    }
    type = "NodePort"
  }

  depends_on = [
    null_resource.backendconfig,
    kubernetes_stateful_set.devpi]
}