
# 🐳 Docker Deployment — Node.js & Flask Apps

This project contains two independently containerized applications:

- 🟢 `nodejs_app`: A Node.js application (exposed on port **3000**)
- 🐍 `flask_app`: A Python Flask application (exposed on port **5000**)

## ✅ Prerequisites

- [Docker] installed and running on your machine

## 🚀 How to Run Each App

### Clone the CI/CD repository

```git clone https://github.com/DevOps-Playground-CM/scripts.git```

### Navigate to the Dockerfile folder

```cd scripts/Dockerfile```

### 🟢 Node.js App

1. Navigate into the `nodejs_app` directory:
```cd nodejs_app```

2. Build the Docker image:
```docker build -t nodejs_app .```

3. Run the container:
```docker run -p 3000:3000 nodejs_app```

🔗 Access the app at: [http://your_server_ip:3000](http://your_server_ip:3000)

---

### 🐍 Flask App

1. Navigate into the `flask_app` directory:
```cd flask_app```

2. Build the Docker image:
```docker build -t flask-app .```

3. Run the container:
```docker run -p 5000:5000 flask-app```

🔗 Access the app at: [http://your_server_ip:5000](http://your_server_ip:5000)

---

### NB

To find your server's public IP address, run:

```curl -s http://ipinfo.io/ip```
