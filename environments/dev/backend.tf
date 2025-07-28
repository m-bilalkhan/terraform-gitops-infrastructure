terraform {
  backend "remote" {
    organization = "terraform-gitops-infrastructure"

    workspaces {
      name = "gitops-dev-ap-south-1"
    }
  }
}