# tf-az-module-virtual-network
Terraform module to crate an Azure virtual Network


## Terraform Documentation
Manages a virtual network including any configured subnets. Each subnet can optionally be configured with a security group to be associated with the subnet.

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#example-usage)

```hcl
resource "azurerm_resource_group" "example" { name = "example-resources" location = "West Europe" } resource "azurerm_network_security_group" "example" { name = "example-security-group" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name } resource "azurerm_virtual_network" "example" { name = "example-network" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name address_space = ["10.0.0.0/16"] dns_servers = ["10.0.0.4", "10.0.0.5"] subnet { name = "subnet1" address_prefixes = ["10.0.1.0/24"] } subnet { name = "subnet2" address_prefixes = ["10.0.2.0/24"] security_group = azurerm_network_security_group.example.id } tags = { environment = "Production" } }
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#argument-reference)

The following arguments are supported:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#name) - (Required) The name of the virtual network. Changing this forces a new resource to be created.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#resource_group_name) - (Required) The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created.
    
-   [`address_space`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#address_space) - (Required) The address space that is used the virtual network. You can supply more than one address space.
    
-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#location) - (Required) The location/region where the virtual network is created. Changing this forces a new resource to be created.
    

___

-   [`bgp_community`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#bgp_community) - (Optional) The BGP community attribute in format `<as-number>:<community-value>`.

-   [`ddos_protection_plan`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#ddos_protection_plan) - (Optional) A `ddos_protection_plan` block as documented below.
    
-   [`encryption`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#encryption) - (Optional) A `encryption` block as defined below.
    
-   [`dns_servers`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#dns_servers) - (Optional) List of IP addresses of DNS servers
    

-   [`edge_zone`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#edge_zone) - (Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created.
    
-   [`flow_timeout_in_minutes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#flow_timeout_in_minutes) - (Optional) The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between `4` and `30` minutes.
    
-   [`subnet`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#subnet) - (Optional) Can be specified multiple times to define multiple subnets. Each `subnet` block supports fields documented below.
    

-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#tags) - (Optional) A mapping of tags to assign to the resource.

___

A `ddos_protection_plan` block supports the following:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#id) - (Required) The ID of DDoS Protection Plan.
    
-   [`enable`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#enable) - (Required) Enable/disable DDoS Protection Plan on Virtual Network.
    

___

A `encryption` block supports the following:

-   [`enforcement`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#enforcement) - (Required) Specifies if the encrypted Virtual Network allows VM that does not support encryption. Possible values are `DropUnencrypted` and `AllowUnencrypted`.

___

The `subnet` block supports:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#name) - (Required) The name of the subnet.
    
-   [`address_prefixes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#address_prefixes) - (Required) The address prefixes to use for the subnet.
    
-   [`security_group`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#security_group) - (Optional) The Network Security Group to associate with the subnet. (Referenced by `id`, ie. `azurerm_network_security_group.example.id`)
    
-   [`default_outbound_access_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#default_outbound_access_enabled) - (Optional) Enable default outbound access to the internet for the subnet. Defaults to `true`.
    
-   [`delegation`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#delegation) - (Optional) One or more `delegation` blocks as defined below.
    
-   [`private_endpoint_network_policies`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#private_endpoint_network_policies) - (Optional) Enable or Disable network policies for the private endpoint on the subnet. Possible values are `Disabled`, `Enabled`, `NetworkSecurityGroupEnabled` and `RouteTableEnabled`. Defaults to `Disabled`.
    

-   [`private_link_service_network_policies_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#private_link_service_network_policies_enabled) - (Optional) Enable or Disable network policies for the private link service on the subnet. Defaults to `true`.

-   [`route_table_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#route_table_id) - (Optional) The ID of the Route Table that should be associated with this subnet.
    
-   [`service_endpoints`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#service_endpoints) - (Optional) The list of Service endpoints to associate with the subnet. Possible values include: `Microsoft.AzureActiveDirectory`, `Microsoft.AzureCosmosDB`, `Microsoft.ContainerRegistry`, `Microsoft.EventHub`, `Microsoft.KeyVault`, `Microsoft.ServiceBus`, `Microsoft.Sql`, `Microsoft.Storage`, `Microsoft.Storage.Global` and `Microsoft.Web`.
    
-   [`service_endpoint_policy_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#service_endpoint_policy_ids) - (Optional) The list of IDs of Service Endpoint Policies to associate with the subnet.
    

___

A `delegation` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#name) - (Required) A name for this delegation.
    
-   [`service_delegation`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#service_delegation) - (Required) A `service_delegation` block as defined below.
    

___

A `service_delegation` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#name) - (Required) The name of service to delegate to. Possible values are `GitHub.Network/networkSettings`, `Microsoft.ApiManagement/service`, `Microsoft.Apollo/npu`, `Microsoft.App/environments`, `Microsoft.App/testClients`, `Microsoft.AVS/PrivateClouds`, `Microsoft.AzureCosmosDB/clusters`, `Microsoft.BareMetal/AzureHostedService`, `Microsoft.BareMetal/AzureHPC`, `Microsoft.BareMetal/AzurePaymentHSM`, `Microsoft.BareMetal/AzureVMware`, `Microsoft.BareMetal/CrayServers`, `Microsoft.BareMetal/MonitoringServers`, `Microsoft.Batch/batchAccounts`, `Microsoft.CloudTest/hostedpools`, `Microsoft.CloudTest/images`, `Microsoft.CloudTest/pools`, `Microsoft.Codespaces/plans`, `Microsoft.ContainerInstance/containerGroups`, `Microsoft.ContainerService/managedClusters`, `Microsoft.ContainerService/TestClients`, `Microsoft.Databricks/workspaces`, `Microsoft.DBforMySQL/flexibleServers`, `Microsoft.DBforMySQL/servers`, `Microsoft.DBforMySQL/serversv2`, `Microsoft.DBforPostgreSQL/flexibleServers`, `Microsoft.DBforPostgreSQL/serversv2`, `Microsoft.DBforPostgreSQL/singleServers`, `Microsoft.DelegatedNetwork/controller`, `Microsoft.DevCenter/networkConnection`, `Microsoft.DocumentDB/cassandraClusters`, `Microsoft.Fidalgo/networkSettings`, `Microsoft.HardwareSecurityModules/dedicatedHSMs`, `Microsoft.Kusto/clusters`, `Microsoft.LabServices/labplans`, `Microsoft.Logic/integrationServiceEnvironments`, `Microsoft.MachineLearningServices/workspaces`, `Microsoft.Netapp/volumes`, `Microsoft.Network/dnsResolvers`, `Microsoft.Network/managedResolvers`, `Microsoft.Network/fpgaNetworkInterfaces`, `Microsoft.Network/networkWatchers.`, `Microsoft.Network/virtualNetworkGateways`, `Microsoft.Orbital/orbitalGateways`, `Microsoft.PowerPlatform/enterprisePolicies`, `Microsoft.PowerPlatform/vnetaccesslinks`, `Microsoft.ServiceFabricMesh/networks`, `Microsoft.ServiceNetworking/trafficControllers`, `Microsoft.Singularity/accounts/networks`, `Microsoft.Singularity/accounts/npu`, `Microsoft.Sql/managedInstances`, `Microsoft.Sql/managedInstancesOnebox`, `Microsoft.Sql/managedInstancesStage`, `Microsoft.Sql/managedInstancesTest`, `Microsoft.Sql/servers`, `Microsoft.StoragePool/diskPools`, `Microsoft.StreamAnalytics/streamingJobs`, `Microsoft.Synapse/workspaces`, `Microsoft.Web/hostingEnvironments`, `Microsoft.Web/serverFarms`, `NGINX.NGINXPLUS/nginxDeployments`, `PaloAltoNetworks.Cloudngfw/firewalls`, `Qumulo.Storage/fileSystems`, and `Oracle.Database/networkAttachments`.
    
-   [`actions`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#actions) - (Optional) A list of Actions which should be delegated. This list is specific to the service to delegate to. Possible values are `Microsoft.Network/networkinterfaces/*`, `Microsoft.Network/publicIPAddresses/join/action`, `Microsoft.Network/publicIPAddresses/read`, `Microsoft.Network/virtualNetworks/read`, `Microsoft.Network/virtualNetworks/subnets/action`, `Microsoft.Network/virtualNetworks/subnets/join/action`, `Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action`, and `Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action`.
    

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#id) - The virtual NetworkConfiguration ID.
    
-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#name) - (Required) The name of the virtual network. Changing this forces a new resource to be created.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#resource_group_name) - (Required) The name of the resource group in which to create the virtual network.
    
-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#location) - (Required) The location/region where the virtual network is created. Changing this forces a new resource to be created.
    
-   [`address_space`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#address_space) - (Required) The list of address spaces used by the virtual network.
    
-   [`guid`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#guid) - The GUID of the virtual network.
    
-   [`subnet`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#subnet) - One or more `subnet` blocks as defined below.
    

___

The `subnet` block exports:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#id) - The ID of this subnet.

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#create) - (Defaults to 30 minutes) Used when creating the Virtual Network.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#update) - (Defaults to 30 minutes) Used when updating the Virtual Network.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#read) - (Defaults to 5 minutes) Used when retrieving the Virtual Network.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#delete) - (Defaults to 30 minutes) Used when deleting the Virtual Network.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#import)

Virtual Networks can be imported using the `resource id`, e.g.

```shell
terraform import azurerm_virtual_network.exampleNetwork /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1
```