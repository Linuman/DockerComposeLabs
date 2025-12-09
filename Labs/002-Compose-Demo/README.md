


# Lab --2 - Docker Compose Demo - Multi-Container Application

<dv>

## Description

This lab demonstrates a practical `Docker Compose` example with a multi-container application. You will explore a complete `docker-compose-sample.yml` file that defines three inter-connected services:

- a web server 
- an application
- a database

---

## Prerequisites

- `Docker` and `Docker Compose` installed
- Basic understanding of `Docker` concepts
- Completion of the previous lab [001-intro](../001-intro/README.md)



<div style="border:2px solid #2196f3; border-radius:8px; padding:1em; margin:1em 0;">
While the labs can be practiced using your local Docker environment, it is recommended to use a cloud-based solution like <b>Google Cloud Shell</b>, in which Docker and Docker Compose are pre-installed and ready to use.<br>
<a href="https://console.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/nirgeier/DockerComposeLabs" target="_blank"><img src="https://gstatic.com/cloudssh/images/open-btn.svg" alt="Open in Cloud Shell" /></a>
</div>

---

## Lab Overview

This `docker-compose-sample.yml` file defines a multi-container application with three services: `web`, `app`, and `db`. Below is a detailed explanation of each section.

### Services

#### 1. `web` Service

- **Image**: Uses the official `nginx:latest` image.
- **Container Name**: The container is named `web-container`.
- **Ports**: Maps port `8080` on the host to port `80` in the container.
- **Environment Variables**:
    - `NGINX_HOST`: Set to `localhost`
    - `NGINX_PORT`: Set to `80`
- **Volumes**: Mounts the `./web-data` directory on the host to `/usr/share/nginx/html` in the container, allowing you to serve custom static files.
- **Networks**: Connects to the `webnet` network.
- **Restart Policy**: Always restarts the container if it stops.

#### 2. `app` Service

- **Build**: Builds the image from a `Dockerfile` located in the `./app` directory.
- **Container Name**: The container is named `app-container`.
- **Ports**: Maps port `3000` on the host to port `3000` in the container.
- **Environment Variables**:
    - `NODE_ENV`: Set to `production`
- **Dependencies**: Depends on the `db` service, ensuring the database starts before the app.
- **Networks**: Connects to both `webnet` and `dbnet` networks.
- **Restart Policy**: Restarts the container on failure.

#### 3. `db` Service

- **Image**: Uses the official `postgres:latest` image.
- **Container Name**: The container is named `db-container`.
- **Environment Variables**:
    - `POSTGRES_USER`: Set to `user`
    - `POSTGRES_PASSWORD`: Set to `password`
    - `POSTGRES_DB`: Set to `mydb`
- **Volumes**: Mounts a named volume `db-data` to `/var/lib/postgresql/data` in the container, persisting database data.
- **Networks**: Connects to the `dbnet` network.
- **Restart Policy**: Restarts the container unless stopped manually.

---

### Volumes

- **`db-data`**: A named volume used by the `db` service to persist `PostgreSQL` database.

---

### Networks

- **`webnet`**: A custom network used by the `web` and `app` services to communicate.
- **`dbnet`**: A custom network used by the `app` and `db` services to communicate.

---

This `docker-compose-sample.yml` file demonstrates how to define services, manage dependencies and configure networks and volumes for a multi-container application.

---

## Lab Exercises

1. **Examine the Sample File**: Review the `docker-compose-sample.yml` file to understand the service definitions.
2. **Analyze Service Dependencies**: Study how the `app` service depends on the `db` service.
3. **Understand Networking**: See how services communicate through custom networks.
4. **Review Volume Management**: Learn how data persistence is handled with defined volumes.

---

## Key Learning Points

- **Multi-Service Architecture**: How to structure applications with multiple containers.
- **Service Dependencies**: Using `depends_on` to control startup order.
- **Network Isolation**: Creating separate networks for different tiers.
- **Data Persistence**: Using volumes to maintain database state.
- **Port Mapping**: Exposing services to the host system.


---

## Next Steps

After completing this lab, you will understand:

- How to structure a real-world multi-container application.
- The relationship between web servers, applications, and databases.
- Best practices for service configuration in `Docker Compose`.