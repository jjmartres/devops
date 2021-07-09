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
