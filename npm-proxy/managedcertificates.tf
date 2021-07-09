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