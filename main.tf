resource "azurerm_mysql_server" "mysql" {
  name                = "${var.MD_MYSQL_PREFIX}-${var.MD_PROJECT_NAME}-${var.MD_SUBSCRIPTION_PREFIX}-${var.MD_REGION_PREFIX}-${var.MD_VM_ENV}"
  location            = var.MD_LOCATION
  resource_group_name = var.MD_RG_NAME

  administrator_login          = var.MD_MYSQL_ADMIN
  administrator_login_password = var.MD_MYSQL_PWD

  sku_name   = var.MD_MYSQL_SKU
  storage_mb = var.MD_MYSQL_DISK_SIZE
  version    = var.MD_MYSQL_VERSION

  auto_grow_enabled                 = true
  backup_retention_days             = 30
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
  tags         = var.MD_ALL_TAGS
}



resource "azurerm_private_endpoint" "mysql_pe" {
  name                = var.MD_PE_NAME
  location            = var.MD_LOCATION
  resource_group_name = var.MD_RG_NAME
  subnet_id           = var.MD_SUBNET_ID
  tags         = var.MD_ALL_TAGS
  
  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.MD_DNS_privatelink_mysql]
  }


  private_service_connection {
    name                           = var.MD_PESC_NAME 
                                     
    private_connection_resource_id = azurerm_mysql_server.mysql.id
    subresource_names              = [ "mysqlServer" ]
    is_manual_connection           = false
  }
  /* NOT READY YET on Azurerm provider
  network_interface {
    name = var.MD_PENIC_NAME
  }
  */
}
