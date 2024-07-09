resource "azurerm_resource_group" "terraform_demo" {
  name     = "cd-rg-${var.environment}-tf-branching"
  location = "Central US"
}

resource "random_id" "storage" {
  byte_length = 4
}

resource "azurerm_storage_account" "example" {
  name                     = "tfexample${random_id.storage.hex}"
  resource_group_name      = azurerm_resource_group.terraform_demo.name
  location                 = azurerm_resource_group.terraform_demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}