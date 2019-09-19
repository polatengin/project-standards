# Terraform - ARM Template - Azure CLI Comparison

Here is the opinianated list of differences of resource provisioning tools

## Terraform

You can get Terraform from https://www.terraform.io/downloads.html

### Pros

* We can use Terraform and target different cloud providers with the same syntax

* We can validate and see changes before actually execute them

* Not every resource can be provisioned just by Terraform, we need to include ARM Templates to do that

### Cons

* Terraform uses Providers to support different cloud providers and usually Providers get updates few versions/months behind from ARM Template or Azure CLI

* Terraform providers doesn't support _all_ features we can do with ARM Templates or Azure CLI

* It's not easy if possible to run scripts and use the output of the script at the decision points (_run this script, if the output is 1 then provision these resources_)

* Dependency on external storage to persist states

* It requires to learn and utilize new language called HCL (Hashicorp Configuration Language)

* Not every resource can be provisioned just by Terraform

* We need to have a machine to invoke Terraform scripts

## ARM Template

ARM Templates are JSON files

### Pros

* ARM Templates are behind almost every deployment scenario to Azure (Azure CLI and PowerShell Modules use it behind the scenes)

* Every ARM Templates are idempotent

### Cons

* JSON files are not best in terms of readibility and maintainability

* JSON files can't have comments, so it's not easy to explain why some piece of JSON is there

## Azure CLI

You can download Azure CLI from https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest

### Pros

* It's very good in terms of readibility and maintainability

* It's so easy to have decision points, loops, etc.

* Azure CLI is cross-platform

### Cons

* I couldn't find anything

## References
