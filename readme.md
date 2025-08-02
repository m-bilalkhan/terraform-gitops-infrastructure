# terraform-gitops-infra

## Overview

**terraform-gitops-infra** is a professional-grade Infrastructure as Code (IaC) project that leverages [Terraform Cloud](https://www.terraform.io/cloud) and GitOps best practices to provision and manage cloud infrastructure. The project demonstrates clean, modular Terraform code, environment isolation, and automated, Git-driven change management.

## Features

- **Terraform Cloud Integration**
  - Remote state management
  - Remote operations (Plan & Apply)
  - Secure variable storage using Terraform Cloud workspaces
  - Workspace separation for `dev` and `prod` environments
  - Secure OpenID Connect Protocol

- **Infrastructure Components**
  - Example resources: VPC, S3 bucket, EC2 instance (can be extended)
  - Modular and reusable Terraform code

- **Best Practices**
  - Environment isolation (separate state and configuration for dev/prod)
  - State isolation per environment
  - Automation and security best practices
  - SSM Connection To Configure Private Instances

## Project Structure

```
.
├── modules/           # Reusable Terraform modules EC2
├── environments/
│   ├── dev/           # Dev environment configuration
│   └── prod/          # Prod environment configuration
├── .github/          
├── README.md
└── ...
```

## AWS Structure
: ![AWS Structure](images/terraform-gitops-infrastructure.drawio.svg)

## Contributing

Contributions are welcome! Please open issues or pull requests for improvements.

## License

[Bilal Khan - MIT](LICENSE)
