resource "kubernetes_secret" "docker-registry" {
  metadata {
    name = "eu-gcr-zorglub"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }
  type = "kubernetes.io/dockerconfigjson"
  data = {
    ".dockerconfigjson" = file("${path.module}/dockerconfigjson.json")
  }

  depends_on = [
    kubernetes_namespace.namespace ]
}