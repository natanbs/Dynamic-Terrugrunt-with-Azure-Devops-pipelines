# Metering - Infrastructure

The goal of the project - to build fully declarative, scallable and reliable cloud infrastructure for AudioCodes Metering

## Prerequisites

Install on your local machine:

- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/)
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/azure-get-started)
- [AZ CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)

Configure AZ CLI:

    az login
    az account list --output table
    az account set --subscription <SubscriptionId>
    az account show

## Manual deployment

Deploy all resources globally:

    terragrunt run-all plan
    terragrunt run-all apply

Deploy / change specific resource:

    cd metering/dev/vnet
    terragrunt plan
    terragrunt apply

## TODO: Configure CI/CD process with Jenkins

## Acknowledgements

- The blob storage was created with the code from this repo - [terraform-azure-blob-storage-backend](https://github.com/langburd/terraform-azure-blob-storage-backend)
