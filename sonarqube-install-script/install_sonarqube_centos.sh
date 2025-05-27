#!/bin/bash

# Exit on error
set -e

# Load configuration file
if [ ! -f ./sonarqube.env ]; then
    cp sonarqube.env.example sonarqube.env
fi

source ./sonarqube.env || { echo "configuration file not found"; exit 1; }

echo "Installing Java and dependencies"
sudo dnf update -y
sudo dnf install -y java-17-openjdk wget unzip zip gnupg curl policycoreutils-python-utils
echo "Java and dependencies installed"

# Set vm.max_map_count
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
echo "fs.file-max=65536" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

echo "Installing PostgreSQL"

sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-$(rpm -E %{rhel})-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo dnf -qy module disable postgresql
sudo dnf install -y postgresql15-server postgresql15
sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
sudo systemctl enable --now postgresql-15

echo "PostgreSQL installed"

echo "Creating database for SonarQube"
sudo -u postgres psql <<EOF
CREATE USER $SONARQUBE_DB_USER WITH ENCRYPTED PASSWORD '$SONARQUBE_DB_PASSWORD';
CREATE DATABASE $SONARQUBE_DB_NAME OWNER $SONARQUBE_DB_USER;
GRANT ALL PRIVILEGES ON DATABASE $SONARQUBE_DB_NAME TO $SONARQUBE_DB_USER;
EOF

echo "Database created"

echo "Downloading SonarQube"

cd /opt/
sudo curl -LO https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SONARQUBE_VERSION}.zip
sudo unzip -q sonarqube-${SONARQUBE_VERSION}.zip
sudo mv sonarqube-${SONARQUBE_VERSION} sonarqube
sudo groupadd -f sonar
sudo useradd -r -d /opt/sonarqube -g sonar sonar || true
sudo chown -R sonar:sonar /opt/sonarqube

echo "SonarQube downloaded and ready to configure"

echo "Configuring SonarQube"

sudo tee /opt/sonarqube/conf/sonar.properties > /dev/null <<EOF
sonar.jdbc.username=${SONARQUBE_DB_USER}
sonar.jdbc.password=${SONARQUBE_DB_PASSWORD}
sonar.jdbc.url=jdbc:postgresql://localhost/${SONARQUBE_DB_NAME}
sonar.web.host=0.0.0.0
sonar.web.port=${SONARQUBE_HTTP_PORT}
EOF

echo "Creating SonarQube service"

sudo tee /etc/systemd/system/sonarqube.service > /dev/null <<EOF
[Unit]
Description=SonarQube service
After=network.target

[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
LimitNOFILE=65536
LimitNPROC=4096

[Install]
WantedBy=multi-user.target
EOF

echo "Enabling and starting SonarQube"

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now sonarqube

echo "Get the public IP address"
SERVER_IP=$(curl ip.me || echo "IP_NOT_DETECTED")

echo "✅ Installation completed successfully!"
echo "🌐 You can access SonarQube at: http://${SERVER_IP}:${SONARQUBE_HTTP_PORT}"
