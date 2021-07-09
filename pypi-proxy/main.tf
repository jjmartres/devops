/**
  *
  * # Pypi-proxy on GKE
  *
  * Pypi-proxy is a PyPI mirror client according to PEP 381 + PEP 503 http://www.python.org/dev/peps/pep-0381/ based on [devpi](https://github.com/devpi/devpi)
  *
  * ## Usage
  * ```bash
  * export PIP_INDEX_URL="https://pypi.ops.zorglub.io/root/pypi/+simple/"
  * pip install <package>
  * ```
  */
locals {
  tfsettingsfile = "${path.module}/env/tfenv-${terraform.workspace}.json"
  tfsettingsfilecontent = fileexists(local.tfsettingsfile) ? file(local.tfsettingsfile) : "{}"
  tfenv = jsondecode(local.tfsettingsfilecontent)

  cluster = lookup(local.tfenv, "cluster")
  values = lookup(local.tfenv, "values")
}

# Retrieve an access token as the Terraform runner
data "google_client_config" "provider" { }

data "google_container_cluster" "cluster" {
  name = local.cluster.name
  location = local.cluster.location
  project = local.cluster.project
}