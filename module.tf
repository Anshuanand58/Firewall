module "firewall" {
  source = "../test"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  virtual_network_name           = var.virtual_network_name
  firewall_subnet_address_prefix = var.firewall_subnet_address_prefix
  firewall_config = {
    name              = var.firewall_config.name 
    sku_name          = var.firewall_config.sku_name 
    sku_tier          = var.firewall_config.sku_tier 
  }
  enable_forced_tunneling                   = true
  firewall_management_subnet_address_prefix = var.firewall_management_subnet_address_prefix 
  public_ip_names = ["fw-public", "fw-private"]
  firewall_application_rules = var.firewall_application_rules
  firewall_network_rules = var.firewall_network_rules
  firewall_nat_rules = var.firewall_nat_rules
  # Adding TAG's to your Azure resources 
  tags = {
    ProjectName  = "demo-internal"
    Env          = "dev"
    Owner        = "user@example.com"
    BusinessUnit = "CORP"
    ServiceClass = "Gold"
  }
}