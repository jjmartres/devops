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
