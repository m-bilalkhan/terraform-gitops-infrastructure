terraform {
  backend "remote" {
    organization = "bilal-solo-adventures"
    project      = "terraform-gitops-infrastructure"

    workspaces {
      name = "gitops-prod-ap-south-1"
    }
  }
}