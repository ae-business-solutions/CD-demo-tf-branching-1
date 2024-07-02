resource "azurerm_resource_group" "terraform_demo" {
  name     = "cd-rg-demo-tf-branching-1"
  location = "Central US"
}

resource "random_id" "storage" {
  byte_length = 8
}

resource "azurerm_storage_account" "example" {
  name                     = "tfexample${ lower(random_id.storage.id) }"
  resource_group_name      = azurerm_resource_group.terraform_demo.name
  location                 = azurerm_resource_group.terraform_demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}