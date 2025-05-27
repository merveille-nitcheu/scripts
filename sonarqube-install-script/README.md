# SonarQube - Automated Installation

This folder contains automated SonarQube installation scripts for Ubuntu/Debian and CentOS/RedHat distributions.
They deploy SonarQube along with PostgreSQL, Java, and the necessary system configuration in a CI/CD context.

## Structure

- `install_sonarqube_ubuntu/centos.sh` — Installation script
  
- `sonarqube.env.example` — Example environment config file
  
- `README.md` — This documentation

## Prerequisites

- A server running Ubuntu  or CentOS with root or sudo access

- Port 9000 must be open to access the SonarQube web interface

- Minimum 2 GB RAM (recommended: 4 GB RAM)

- Minimum 2 CPU cores

- At least 10 GB of free disk space for SonarQube and its dependencies

- Stable Internet connection to download dependencies and SonarQube binaries

## Usage

### Clone the CI/CD repository

```git clone https://github.com/DevOps-Playground-CM/scripts.git```

### Navigate to the sonarqube folder

```cd scripts/sonarqube-install-script```

### Create the file environment

```cp sonarqube.env.example sonarqube.env```

### Modify and save it if necessary

```nano sonarqube.env``` and ```source sonarqube.env```

### Make the script executable

- On Ubuntu/Debian:

```chmod +x install_sonarqube_ubuntu.sh```

- On CentOS/RedHat:

```chmod +x install_sonarqube_centos.sh```

### Run the script according to your OS

- On Ubuntu/Debian:

```sudo ./install_sonarqube_ubuntu.sh```

- On CentOS/RedHat:

```sudo ./install_sonarqube_centos.sh```

### Open port 9000 in the firewall to access SonarQube

- On Ubuntu (using ufw):

```sudo ufw allow 9000```

- On CentOS (using firewalld):

```sudo firewall-cmd --permanent --add-port=9000```

### Access

To find your server's public IP address, run:

```curl -s http://ipinfo.io/ip```

Access SonarQube via: http://<your_server_ip>:9000

### Default login credentials

Username: admin

Password: admin
