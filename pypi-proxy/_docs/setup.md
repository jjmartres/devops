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