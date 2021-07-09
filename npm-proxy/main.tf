/**
  *
  * # Npm-proxy on GKE
  *
  * Npm-proxy is a simple, zero-config-required local private npm registry based on [verdaccio](https://github.com/verdaccio/verdaccio).
  *
  * ## Usage
  * ### YARN
  * ```bash
  * echo 'registry "https://npm.ops.zorglub.io"' > .yarnrc
  * yarn add <package>
  * ```
  *
  * ### NPM
  * ```bash
  * npm config set registry https://npm.ops.zorglub.io
  * npm install <package>
  * ```
  *
  * <!-- nothing here -->
  */
locals {
  tfsettingsfile = "${path.module}/env/tfenv-${terraform.workspace}.json"
  tfsettingsfilecontent = fileexists(local.tfsettingsfile) ? file(local.tfsettingsfile) : "{}"
  tfenv = jsondecode(local.tfsettingsfilecontent)

  cluster = lookup(local.tfenv, "cluster")
  values = lookup(local.tfenv, "values")
}

# Retrieve an access token as the Terraform runner
data "google_client_config" "provider" {}

data "google_container_cluster" "cluster" {
  name = local.cluster.name
  location = local.cluster.location
  project = local.cluster.project
}