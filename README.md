# 🛠️ DevOps Playground – Scripts Repository

Welcome to the **DevOps Playground Scripts Repo** — a collection of standalone folders, each containing a script or automation utility with its own documentation and helper files.

---

## 📁 Folder Structure (Example)

```

scripts/
├── ec2-launcher/             # Script to launch EC2 instances + README
├── docker-image-builder/     # Script to build and push Docker images
├── eks-bootstrap/            # Script to bootstrap EKS with RBAC and namespaces
├── grafana-alert-setup/      # Sets up alerts in Grafana via API
├── slack-notifier/           # Script to send Slack messages with attachments
├── yaml-validator/           # Validates YAML files for CI/CD usage
└── read-secret-manager/      # Reads secrets from AWS Secret Manager

````

Each folder should include:
- The script(s)
- A `README.md` explaining how to use it
- Any required sample files, configs, or `.env.example`

---

## 🧪 How to Use a Script

1. Browse the folders and choose a script you need.
2. Read the script’s `README.md` for setup and usage.

---

## 🧾 Naming and Structure

To add a new script:

✅ **Create a new folder** named after what the script does (e.g., `vpc-setup`, `send-notification`)
✅ **Include a `README.md`** that explains the script
✅ **Keep supporting files** (like config samples) inside that folder
✅ **Keep scripts modular and well-commented**

---

## 🤝 Contribution Guidelines

* One script (or script set) = One folder
* Always include a `README.md` in your folder
* Name folders clearly based on purpose
* Scripts should be executable and tested
* Use `.env.example` for any required environment variables

---

## 🙋 Maintainers

This repository is maintained by the **DevOps Playground volunteer team** and is open to contributions from all members.

Let’s automate smartly! 🚀
