# _Terraform_ - ARM Template - Azure CLI Comparison

Here is the opinianated list of differences of resource provisioning tools

## _Terraform_

You can get _Terraform_ from https://www.terraform.io/downloads.html

### Pros

* We can use _Terraform_ and target different cloud providers with the same syntax

* We can validate and see changes before actually execute them

* Not every resource can be provisioned just by _Terraform_, we need to include ARM Templates to do that

### Cons

* _Terraform_ uses Providers to support different cloud providers and usually Providers get updates few versions/months behind from ARM Template or Azure CLI

* _Terraform_ providers doesn't support _all_ features we can do with ARM Templates or Azure CLI

* It's not easy if possible to run scripts and use the output of the script at the decision points (_run this script, if the output is 1 then provision these resources_)

* Dependency on external storage to persist states

* It requires to learn and utilize new language called HCL (Hashicorp Configuration Language)

* Not every resource can be provisioned just by _Terraform_

* We need to have a machine to invoke _Terraform_ scripts

## ARM Template

_ARM Templates_ are actually _JSON_ formatted documents

### Pros

* _ARM Templates_ are behind almost every deployment scenario to Azure (Azure CLI and PowerShell Modules use it behind the scenes)

* Every _ARM Template_ deployment is idempotent

### Cons

* _JSON_ files are not best in terms of readibility and maintainability

* _JSON_ files can't have comments, so it's not easy to explain why some piece of JSON is there

## Azure CLI

You can download _Azure CLI_ from https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest

### Pros

* It's very good in terms of readibility and maintainability

* It's so easy to have decision points, loops, etc.

* _Azure CLI_ is cross-platform

### Cons

* I couldn't find anything 😉

## References
