
terraform {
  backend "gcs" {
    bucket  = "troussauio-infra-state"
    prefix  = "terraform/state/dev"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.86.0"
    }
  }
}

provider "google" {
  //credentials = file(var.keyfile_location)
  region      = var.region
  project     = var.gcp_project_id
}

module "kubernetes" {
  source = "../modules/gcp-k8s-cluster"
  region = var.region
  prefix = var.prefix

  machines    = var.machines
  ssh_pub_key = var.ssh_pub_key

  master_sa_email  = var.master_sa_email
  master_sa_scopes = var.master_sa_scopes
  worker_sa_email  = var.worker_sa_email
  worker_sa_scopes = var.worker_sa_scopes

  ssh_whitelist        = var.ssh_whitelist
  api_server_whitelist = var.api_server_whitelist
  nodeport_whitelist   = var.nodeport_whitelist
  inventory_file = var.inventory_file
}