# 🌐 Terraform Global Web App (Modular Version)

This project is a **refactored version** of my original Terraform Global Web App deployment. It introduces modular infrastructure-as-code design using Terraform modules, starting with a reusable `vpc_module`.

This modular deployment is the base infrastructure layer for my ‘Global Web App Acceleration with CloudFront, Route 53, and WAF’ project.

This repo focuses on the core multi-region Terraform layout only (VPCs, subnets, EC2). Higher-level services (CloudFront, WAF, global routing) are covered in a separate project.
---

## 🧱 Modularization Goals

- Improve **reusability** of Terraform code across environments
- Promote **scalability** for future multi-region deployments
- Separate responsibilities (networking, compute, monitoring) into clear modules

---

## ✅ What’s Included

- `main.tf` defines two AWS regions (us-east-1 and ap-southeast-1)
- Reusable `vpc_module` provisions:
  - VPC
  - Public Subnet
  - Internet Gateway
  - Route Table + Association
- GitHub-ready documentation (`README`, `.gitignore`, future module instructions)

---

## 🚧 Not Yet Included (Planned)

These features are implemented in the pre-modular version and will be modularized once validated:

- ❌ `ec2_module` (EC2 + SSM + user_data logic)
- ❌ `monitoring_module` (CloudWatch alarms)
- ❌ `terraform.tfvars` and input parameterization at root
- ❌ GitHub Actions workflows (`.github/workflows/terraform.yml`)

---

## 📂 Project Structure

```
global-webapp-modular/
├── main.tf
├── modules/
│   └── vpc_module/
│       └── main.tf
├── README.md
└── .gitignore
```

---

## 🧪 Usage

```bash
terraform init
terraform apply
```

> ⚠️ Be sure to update AMI IDs and CIDRs as needed.

---

## 🔁 Related Project

This is a modular upgrade of my [pre-modular version](https://github.com/your-username/terraform-global-webapp), which includes EC2 deployment, user_data bootstrapping, CloudWatch alarms, and SSM access.

---

## 🛠 Skills Demonstrated

Terraform · AWS VPC · Infrastructure as Code (IaC) · Modular Design · Multi-Region Architecture · Subnetting · DevOps Practices · GitHub Documentation

---

## 📌 License

This project is for educational and professional demonstration purposes. It is not intended for production use without customization.
