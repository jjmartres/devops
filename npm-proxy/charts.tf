resource "helm_release" "chart" {
  chart = "verdaccio"
  repository = "https://charts.verdaccio.org"
  name = "npm-proxy"
  namespace = kubernetes_namespace.namespace.metadata[0].name
  timeout = local.values.timeout
  force_update = true
  recreate_pods = true

  values = [
    file("${path.module}/resources/values.yaml")
  ]

  set {
    name = "image.tag"
    value = local.values.version
  }

  depends_on = [
    kubernetes_namespace.namespace
  ]
}