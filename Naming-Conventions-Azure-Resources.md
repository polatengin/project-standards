# Naming Conventions for Azure Resources

We need to have multiple conventions for different types of resources on Azure.

List in the below is the conventions for most common types. We can increase the coverage of the list by adding more types and we can use exceptions to name infrequently used types, such as, Biztalk, Blockchain, etc.

## Rules and Restrictions

We can use affixes (prefix or suffix) to avoid conflicts with other resources.

AnalyticalSandbox*Web* or *Web*AnalyticalSandbox

## Subscriptions

Recommended pattern for naming subscriptions is:

{Company} {Department (optional)} {Product Line (optional)} {Environment}

Contoso IT AnalyticalSandboxes Production

Contoso IT ERP Staging

## Resource Types

Here is the naming conventions for resource types

**Resource Group**

{service short name}-{environment}-rg

*profx-prod-rg*

**Availability Set**

{service-short-name}-{context}-as

*profx-sql-as*

**Web App**

{app_name}-{source-slot-name}

*contoso-staging*

**API Management**

{apim-service-name}-apim

*contoso-apim*

**Key Vault**

{service short name}-{environment}-kv

*contoso-prod-kv*

**Virtual Machine**

{name}-{role}-vm{number}

*profx-sql-vm1*

**Function App**

{name}-func

*calcprofit-func*

**Storage account name (data)**

{globally unique name}{number}

*profxdata001*

**Storage account name (disks)**

{vm name without hyphens}st{number}

*profxsql001st0*

**Container name**

{context}

*logs*

**Queue name**

{service short name}-{context}-{num}

*awesomeservice-messages-001*

**Table name**

{service short name}{context}

*awesomeservicelogs*

**Data Lake Store**

{name}dls

*telemetrydls*

**Managed Disk name**

{disktype}disk{number}

*OSdisk1*

**Virtual Network (VNet)**

{service short name}-vnet

*profx-vnet*

**Subnet**

{descriptive context}

*web*

**Network Interface**

{vmname}-nic{num}

*profx-sql1-vm1-nic1*

**Network Security Group**

{service short name}-{context}-nsg

*profx-app-nsg*

**Network Security Group Rule**

{descriptive context}

*sql-allow*

**Public IP Address**

{vm or service name}-pip

*profx-sql1-vm1-pip*

**Load Balancer**

{service or role}-lb

*profx-lb*

**Azure Application Gateway**

{service or role}-agw

*profx-agw*

**Container Registry**

{service short name}registry

*app1registry*

**Service Bus namespace**

{service short name}-bus

*app1-bus*

**Event hub**

{service}-{role}-eh

*app1-orders-eh*

**Event Hubs namespace**

{service}-ehns

*app1-ehns*

## References

[Naming conventions for Azure resources](https://docs.microsoft.com/en-us/azure/architecture/best-practices/naming-conventions)
