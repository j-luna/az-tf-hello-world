terraform {
    backend "azurerm" {
        resource_group_name  = "rg-tfstate"
        storage_account_name = "strsmatfstate"
        container_name       = "cnt-tf-az-hello-world"
        key                 = "terraform.tfstate"
    }
}
# The above code configures the backend for Terraform to use Azure Storage for state management.