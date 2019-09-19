# Tagging Best Practices for Azure Resources

Tagging resources is highly coupled to the team culture, organizational tree, etc.

## Rules and Restrictions

Each resource can have a maximum of 15 tags

The tag name is limited to 512 characters, and the tag value is limited to 256 characters

## Tagging Strategy

Tag resources when creating them, this will prevent un-tagged resources somehow (glitch on provisioning steps of creating resources, etc.)

## Common Approaches for Tagging

Use tags to group/filter resources for cost analysis

*CostCenter=CC1234*

*BillingCode=BC1234*

*Region=Global* or *Region=LATAM*

*Responsible=DataScienceTeam-15* or *Owner=john@doe.com*

Use tags to group/filter resources for versioning

*Version=1*

*Version=2019-08-16*

Use tags to group/filter resources for projects

*Project=AnalyticalSandboxes* or *Project=Project1234*

Use tags to group/filter resources for use-cases

*Environment=Staging*

*Reason=FrontEnd*

*Dependency=WebApi*

## References

[Naming conventions for Azure resources](https://docs.microsoft.com/en-us/azure/architecture/best-practices/naming-conventions)

[Azure Tagging Best Practices](https://click.cloudcheckr.com/rs/222-ENM-584/images/azure-tagging_2018.pdf)

[Tagging Best Practices for Cloud Governance and Cost Management](https://blogs.flexera.com/cloud/enterprise-cloud-strategies/tagging-best-practices-for-cloud-governance-and-cost-management/)

[Azure Resource Tagging Best Practices](https://www.cryingcloud.com/blog/2016/07/18/azure-resource-tagging-best-practices)

[Resource Tagging Best Practices (Part 1 - Auditing)](https://cryingcloud.squarespace.com/blog/2018/10/12/resource-tagging-best-practices-applied-part-1-auditing)

[Resource Tagging Best Practices (Part 2 - Enforcement)](https://www.cryingcloud.com/blog/2018/10/14/resource-tagging-best-practices-applied-part-2-enforcement)
