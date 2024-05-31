terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.90.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.55.0"
    }
  }
}

provider "hcp" {
}

provider "tfe" {
}