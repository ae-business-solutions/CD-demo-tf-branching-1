terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.5"

  backend "azurerm" {
    resource_group_name  = "cd-rg-shared-demo" # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "cddemostorage"     # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    #container_name       = "tfstate-branching"      # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    #key                  = "<env>.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  subscription_id = "8e563f2f-b3f8-4515-9a39-ab628973090e" #AEBS Dev/Test
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}