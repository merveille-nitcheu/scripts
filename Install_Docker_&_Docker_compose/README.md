# Docker & Docker Compose Installation Script for Ubuntu

This script installs the latest version of **Docker Engine** and **Docker Compose (v2 plugin)** on Ubuntu-based systems.

## ✅ Features

- Updates the system packages
- Installs required dependencies
- Adds the official Docker GPG key and repository
- Installs Docker Engine, CLI, and Compose plugin
- Adds the current user to the `docker` group
- Verifies Docker and Docker Compose installation
- Supports re-execution with `sudo` if not run as root

## 🧑‍💻 Requirements

- Ubuntu 20.04 / 22.04 or later
- Internet connection
- Sudo/root privileges

## 🚀 How to Use

1. **Download the script** ```git clone https://github.com/DevOps-Playground-CM/scripts.git```
   
2. Navigate to the sonarqube folder ```cd scripts/Install_Docker_&_Docker_compose```
   
3. Make it executable ```chmod +x install_docker.sh```
   
4. Run the script ```sudo ./install_docker.sh```