resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "pypi-proxy"
    labels = {
      app = "devpi"
      stack = "kubernetes"
    }
  }
}