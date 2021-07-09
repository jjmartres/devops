/*
TODO: https://github.com/hashicorp/terraform-provider-kubernetes-alpha/pull/41
/*
resource "kubernetes_manifest" "cloud_armor" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "cloud.google.com/v1beta1"
    "kind" = "BackendConfig"
    "metadata" = {
      "name" = "cloud-armor"
      "namespace" = kubernetes_namespace.namespace.metadata[0].name
    }
    "spec" = {
      "securityPolicy" = {
        "name" = "ops-cloud-armor"
      }
      "timeoutSec" = 600
    }
  }

  depends_on = [
    kubernetes_config_map.rp ]
}*/

data "template_file" "backendconfig" {
  template = file("${path.module}/resources/backendconfig.yaml")
}

resource "null_resource" "backendconfig" {
  triggers = {
    manifest_sha1 = sha1(data.template_file.backendconfig.rendered)
  }

  provisioner "local-exec" {
    command = "kubectl create -n ${kubernetes_namespace.namespace.metadata[0].name} -f -<<EOF\n${data.template_file.backendconfig.rendered}\nEOF"
  }

  depends_on = [ kubernetes_namespace.namespace ]
}