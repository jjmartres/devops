resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "npm-proxy"
    labels = {
      app = "verdaccio"
      stack = "helm"
    }
  }
}