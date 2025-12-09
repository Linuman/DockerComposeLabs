
# Lab 001 - Docker Compose Introduction

---

## Description

- This lab provides a comprehensive introduction to `Docker Compose`, a tool for defining and running multi-container Docker applications.
- You will learn the fundamentals of `Docker Compose` and how to set it up on different operating systems.

---

## Prerequisites

- Basic understanding of Docker concepts
- Docker installed on your system



<div style="border:2px solid #2196f3; border-radius:8px; padding:1em; margin:1em 0;">
While the labs can be practiced using your local Docker environment, it is recommended to use a cloud-based solution like <b>Google Cloud Shell</b>, in which Docker and Docker Compose are pre-installed and ready to use.<br>
<a href="https://console.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/nirgeier/DockerComposeLabs" target="_blank"><img src="https://gstatic.com/cloudssh/images/open-btn.svg" alt="Open in Cloud Shell" /></a>
</div>




## What You will Learn

- What `Docker Compose` is and what are its benefits
- How to install `Docker Compose` on different platforms
- Basic concepts of multi-container orchestration

---

## Lab's achievements

After completing this lab, you will be ready to:

- Create your first docker-compose.yml file
- Understand service definitions
- Manage multi-container applications
- Move on to more advanced `Docker Compose` features



---

## Key Concepts Covered

- **Multi-container Applications**: Understanding how `Docker Compose` simplifies managing multiple containers
- **YAML Configuration**: Introduction to the `docker-compose.yml` file structure
- **Service Orchestration**: How containers work together in a composed application
- **Development Workflow**: Using `Docker Compose` for local development environments

---

## Installation Methods

1. **Docker Desktop** (on Windows or macOS): Included by default within Docker Desktop software
2. **Linux Package Managers**: Using apt-get / yum / dnf etc. (linux flavor dependent)
3. **Manual Installation**: Downloading from GitHub releases
4. **Homebrew** (macOS) / **Winget** (Windows): Using the brew or winget package managers

---



## 01. What is `Docker Compose`?

- `Docker Compose` is a tool for defining and running multi-container `Docker` applications.
- With `Docker Compose`, you use a `YAML` file to configure your application's services.
- Then, with a simple command(s), you can create and start all the services from your configuration.
- This greatly simplifies the development, testing, and deployment of complex applications.
- It allows you to define the services, networks, and volumes your application needs in a single file (`docker-compose.yml`), making it easy to manage and share your application setup.
- `Docker Compose` is particularly useful for local development, `CI/CD pipelines`, and orchestrating **multi-container** applications.

---

## 02. How to Install Docker Compose



### -- Docker Desktop for Windows and macOS

- If you are using `Docker Desktop` for Windows or macOS, `Docker Compose` is included in the bundle by default.


### -- Linux

- If you are using Linux, you might need to install it separately.
- Please refer to the [official Docker documentation](https://docs.docker.com/compose/install/) for installation instructions.
- You can install it using the official `Docker Compose` package for your Linux distribution.
- For example, on Ubuntu, you can run:

```bash
# Install `Docker Compose` using apt-get
sudo apt-get install docker-compose
```

- Or, if you prefer to install it manually, you can download the binary from the official GitHub repository:

```bash
# Install from GitHub repository and move it to /usr/local/bin
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

- Verify your installation by running:

```bash

# Verify `Docker Compose` installation
docker compose version

# For older versions
docker-compose --version

# Or if using macos and installing using brew
brew info docker-compose

### Output
Isolated development environments using Docker
https://docs.docker.com/compose/
Installed
/opt/homebrew/Cellar/docker-compose/2.36.0 (8 files, 59.7MB) *
Poured from bottle using the formulae.brew.sh API on 2025-05-08 at 11:23:08
From: https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/d/docker-compose.rb
License: Apache-2.0
==> Dependencies
Build: go ✘
==> Options
--HEAD
Install HEAD version
==> Caveats
Compose is a Docker plugin. For Docker to find the plugin, add "cliPluginsExtraDirs" to ~/.docker/config.json:
"cliPluginsExtraDirs": [
    "/opt/homebrew/lib/docker/cli-plugins"
]
==> Analytics
install-on-request: 28,379 (30 days), 85,181 (90 days), 325,794 (365 days)
build-error: 65 (30 days)
```


### -- macOS using Homebrew

- If you are using macOS, you can install `Docker Compose` using Homebrew:

```bash

# Install `Docker Compose` using Homebrew
brew install docker-compose

# After installation, you can verify it by running:


# Verify `Docker Compose` installation
docker compose version  
```
