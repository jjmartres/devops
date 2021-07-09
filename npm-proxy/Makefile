# Check that given variables are set and all have non-empty values,
# die with an error otherwise.
#
# Params:
#   1. Variable name(s) to test.
#   2. (optional) Error message to print.
check_defined = \
    $(strip $(foreach 1,$1, \
        $(call __check_defined,$1,$(strip $(value 2)))))
__check_defined = \
    $(if $(value $1),, \
      $(error Undefined $1$(if $2, ($2))))

.PHONY: help init validate plan apply output config
.SILENT: clean destroy

.DEFAULT_GOAL := help

init:  ## Initialize Terraform environment for NPM mirror deployment
	$(call check_defined, ENV, Define Terraform environment)
	@terraform get; \
	terraform init -reconfigure -backend-config=bucket=$${TF_BUCKET} -backend-config=prefix=devops/$$(basename $$PWD); \
	terraform workspace select $$ENV || terraform workspace new $$ENV

validate: ## Validate the Terraform files for NPM mirror deployment
	$(call check_defined, ENV, Define Terraform environment)
	@terraform workspace select $$ENV >/dev/null; \
	terraform validate

plan: ## Generate and show the Terraform execution plan for NPM mirror deployment
	$(call check_defined, ENV, Define Terraform environment)
	@terraform workspace select $$ENV >/dev/null; \
	terraform plan

apply: ## Builds or changes Terraform infrastructure for NPM mirror deployment
	$(call check_defined, ENV, Define Terraform environment)
	@terraform workspace select $$ENV >/dev/null; \
	terraform apply -auto-approve

destroy: ## Destroy Terraform managed infrastructure for NPM mirror deployment
	$(call check_defined, ENV, Define Terraform environment)
	@terraform workspace select $$ENV >/dev/null; \
	terraform destroy -auto-approve
	@rm -rf .terraform

install: init validate apply ## Init, validate and apply Terraform configuration for NPM mirror deployment

clean: destroy ## Destroy Terraform managed infrastructure for NPM mirror deployment

help: ## Show this help
	@grep -E '^([a-zA-Z_-]+|[a-zA-Z_-]+/[a-zA-Z_-]+):.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
