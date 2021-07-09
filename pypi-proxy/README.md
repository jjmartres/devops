<!-- BEGIN_TF_DOCS -->

# Pypi-proxy on GKE

Pypi-proxy is a PyPI mirror client according to PEP 381 + PEP 503 http://www.python.org/dev/peps/pep-0381/ based on [devpi](https://github.com/devpi/devpi)

## Usage
```bash
export PIP_INDEX_URL="https://pypi.ops.zorglub.io/root/pypi/+simple/"
pip install <package>
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
## Modules

No modules.
<!-- setup.md -->
## Setup
### Build docker image
[build docker image](docker/README.md#build)

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
ENV=pypi-proxy make <actions>
```

### Available actions

```bash
apply                          Builds or changes Terraform infrastructure for PyPi mirror deployment
clean                          Destroy Terraform managed infrastructure for PyPi mirror deployment
destroy                        Destroy Terraform managed infrastructure for PyPi mirror deployment
help                           Show this help
init                           Initialize Terraform environment for PyPi mirror deployment
install                        Init, validate and apply Terraform configuration for PyPi mirror deployment
plan                           Generate and show the Terraform execution plan for PyPi mirror deployment
validate                       Validate the Terraform files for PyPi mirror deployment
```

## Outputs

No outputs.
<!-- other.md -->
<!-- END_TF_DOCS -->