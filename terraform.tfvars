
  resource_group_name            = "demo-RG"
  location                       = "Central US"
  virtual_network_name           = "firewallvnet"
  firewall_subnet_address_prefix = ["10.0.0.0/24"]

  firewall_config = {
    name              = "testfirewall1"
    sku_name          = "AZFW_VNet"
    sku_tier          = "Standard"
  }
  enable_forced_tunneling                   = true
  firewall_management_subnet_address_prefix = ["10.0.1.0/24"]
 
  public_ip_names = ["fw-public", "fw-private"]

  firewall_application_rules = [
    {
      name             = "microsoft"
      action           = "Allow"
      source_addresses = ["10.0.0.0/8"]
      target_fqdns     = ["*.microsoft.com"]
      protocol = {
        type = "Http"
        port = "80"
      }
    },
  ]

  firewall_network_rules = [
    {
      name                  = "ntp"
      action                = "Allow"
      source_addresses      = ["10.0.0.0/8"]
      destination_ports     = ["123"]
      destination_addresses = ["*"]
      protocols             = ["UDP"]
    },
  ]

  firewall_nat_rules = [
    {
      name                  = "testrule"
      action                = "Dnat"
      source_addresses      = ["10.0.0.0/8"]
      destination_ports     = ["53", ]
      destination_addresses = ["fw-public"]
      translated_port       = 53
      translated_address    = "8.8.8.8"
      protocols             = ["TCP", "UDP", ]
    },
  ]
  # Adding TAG's to your Azure resources 
  tags = {
    ProjectName  = "demo-internal"
    Env          = "dev"
    Owner        = "user@example.com"
    BusinessUnit = "CORP"
    ServiceClass = "Gold"
  }
