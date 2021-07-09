<!-- BEGIN_TF_DOCS -->

# Npm-proxy on GKE

Npm-proxy is a simple, zero-config-required local private npm registry based on [verdaccio](https://github.com/verdaccio/verdaccio).

## Usage
### YARN
```bash
echo 'registry "https://npm.ops.zorglub.io"' > .yarnrc
yarn add <package>
```

### NPM
```bash
npm config set registry https://npm.ops.zorglub.io
npm install <package>
```

<!-- nothing here -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
## Modules

No modules.
<!-- setup.md -->
## Setup
### Docker registry authentication

[Setting up authentication for Docker](https://cloud.google.com/artifact-registry/docs/docker/authentication#json-key)

### Environment variables
If not already done, export environment variables:

```bash
export GOOGLE_APPLICATION_CREDENTIALS="$PWD/terraform.json"
export GOOGLE_TERRAFORM_BUCKET="tfstate-gcp-bucket"
```
<!-- usage.md -->
## Usage

You can use this deployment recipe like this:

```bash
ENV=npm-proxy make <actions>
```

### Available actions

```bash
apply                          Builds or changes Terraform infrastructure for NPM mirror deployment
clean                          Destroy Terraform managed infrastructure for NPM mirror deployment
destroy                        Destroy Terraform managed infrastructure for NPM mirror deployment
help                           Show this help
init                           Initialize Terraform environment for NPM mirror deployment
install                        Init, validate and apply Terraform configuration for NPM mirror deployment
plan                           Generate and show the Terraform execution plan for NPM mirror deployment
validate                       Validate the Terraform files for NPM mirror deployment
```

## Outputs

No outputs.
<!-- other.md -->
<!-- END_TF_DOCS -->