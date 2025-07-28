# terraform-gitops-infra

## Overview

**terraform-gitops-infra** is a professional-grade Infrastructure as Code (IaC) project that leverages [Terraform Cloud](https://www.terraform.io/cloud) and GitOps best practices to provision and manage cloud infrastructure. The project demonstrates clean, modular Terraform code, environment isolation, and automated, Git-driven change management.

## Features

- **Terraform Cloud Integration**
  - Remote state management
  - Remote operations (Plan & Apply)
  - Secure variable storage using Terraform Cloud workspaces
  - Workspace separation for `dev` and `prod` environments

- **Infrastructure Components**
  - Example resources: VPC, S3 bucket, EC2 instance (can be extended)
  - Modular and reusable Terraform code

- **Best Practices**
  - Environment isolation (separate state and configuration for dev/prod)
  - Git-driven workflow (pull requests, code reviews, and automated plans)
  - State isolation per environment
  - Automation and security best practices

## Project Structure

```
.
├── modules/           # Reusable Terraform modules (e.g., vpc, s3, ec2)
├── environments/
│   ├── dev/           # Dev environment configuration
│   └── prod/          # Prod environment configuration
├── .github/           # GitHub Actions workflows (CI/CD)
├── README.md
└── ...
```

## Getting Started

### Prerequisites

- [Terraform CLI](https://www.terraform.io/downloads.html)
- [Terraform Cloud](https://app.terraform.io/)
- Cloud provider credentials (e.g., AWS)

### Setup

1. **Clone the repository**
   ```sh
   git clone https://github.com/your-org/terraform-gitops-infra.git
   cd terraform-gitops-infra
   ```

2. **Configure Terraform Cloud**
   - Create two workspaces in Terraform Cloud: `dev` and `prod`.
   - Set environment variables and secrets in each workspace as needed.

3. **Initialize and Apply**
   - Navigate to the desired environment directory:
     ```sh
     cd environments/dev
     terraform init
     terraform plan
     terraform apply
     ```
   - All changes should be managed via pull requests for GitOps compliance.

## GitOps Workflow

1. **Branch and PR Workflow**
   - Create a feature branch for changes.
   - Open a pull request; Terraform Cloud will automatically run `plan`.
   - Review and merge PR to trigger `apply` in the appropriate workspace.

2. **State Isolation**
   - Each environment (`dev`, `prod`) has its own isolated state in Terraform Cloud.

## Security & Automation

- Sensitive variables are stored securely in Terraform Cloud.
- Automated CI/CD pipelines (e.g., GitHub Actions) can be configured for policy checks and notifications.

## Contributing

Contributions are welcome! Please open issues or pull requests for improvements.

## License

[MIT](LICENSE)

---

*This project is intended as a template for professional Terraform GitOps workflows. Adapt and extend as needed for your