/*
TODO: https://github.com/hashicorp/terraform-provider-kubernetes-alpha/pull/41
/*
resource "kubernetes_manifest" "namespace_ops_zorglub_io" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "networking.gke.io/v1beta1"
    "kind" = "ManagedCertificate"
    "metadata" = {
      "name" = "namespace.ops.zorglub.io"
      "namespace" = kubernetes_namespace.namespace.metadata[0].name
      "labels" = {
        "app" = "rp"
        "stack" = "halyard"
      }
    }
    "spec" = {
      "domains" = [
        "namespace.ops.zorglub.io",
      ]
    }
  }

  depends_on = [
    kubernetes_config_map.rp ]
}
*/

data "template_file" "managedcertificate" {
  template = file("${path.module}/resources/managedcertificate.yaml")
}

resource "null_resource" "managedcertificate" {
  triggers = {
    manifest_sha1 = sha1(data.template_file.managedcertificate.rendered)
  }

  provisioner "local-exec" {
    command = "kubectl create -n ${kubernetes_namespace.namespace.metadata[0].name} -f -<<EOF\n${data.template_file.managedcertificate.rendered}\nEOF"
  }

  depends_on = [ kubernetes_namespace.namespace ]

}