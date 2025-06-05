# 🔐 Deploying a Reverse Proxy with NGINX and Let's Encrypt for Dockerized Applications

## 📌 Purpose

This project sets up a reverse proxy using NGINX with automatic SSL certificate management via Let's Encrypt, using the Docker images jwilder/nginx-proxy and jrcs/letsencrypt-nginx-proxy-companion.
It allows you to deploy multiple applications with automatic HTTPS security.

## ✅ Prerequisites

Before starting, ensure the following:

🔹 A working domain name pointed to your public server IP.

🔹 Ports 80 (HTTP) and 443 (HTTPS) are open on your firewall and cloud provider.

🔹 Docker and Docker Compose are installed on your Ubuntu server.

🔹 Create a shared external Docker network:  ```docker network create nginx_proxy``` 

## 🚀 Starting the Reverse Proxy

In the folder containing docker-compose.yaml, run:
```docker compose up -d```
This will:

- Start NGINX listening on ports 80 and 443

- Allow the Let's Encrypt companion container to generate certificates for defined virtual hosts
  