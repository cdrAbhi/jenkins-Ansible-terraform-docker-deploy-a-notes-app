![Blank diagram (3)](https://github.com/user-attachments/assets/d2c6ca81-7d8b-4c62-b997-57c1d08a5f49)

# 🔶🔹 End-to-End Automation Pipeline Using Jenkins, Terraform, Ansible, Docker, and CI/CD 🔹🔶

## Table of Contents
- [Introduction](#introduction)
- [Infrastructure Architecture](#infrastructure-architecture)
- [Pipeline Workflow](#pipeline-workflow)
- [Steps Involved](#steps-involved)
  - [1. Provision Infrastructure with Terraform](#1-provision-infrastructure-with-terraform)
  - [2. Jenkins and Docker Installation](#2-jenkins-and-docker-installation)
  - [3. Ansible Playbook for Deployment](#3-ansible-playbook-for-deployment)
  - [4. Jenkins Pipeline Configuration](#4-jenkins-pipeline-configuration)
  - [5. Django Notes App Deployment](#5-django-notes-app-deployment)
  - [6. CI/CD Pipeline Execution and Automation](#6-cicd-pipeline-execution-and-automation)
- [Outcome](#outcome)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)

---

## Introduction

This project demonstrates the development of a fully automated **CI/CD pipeline** integrating Jenkins, Terraform, Ansible, Docker, and GitHub to automate the deployment of a Django Notes app. The pipeline ensures efficient provisioning, integration, and delivery of code changes, enabling seamless application updates.

---

## Infrastructure Architecture

The pipeline is designed with the following infrastructure:
- **Server `s-1`**: Orchestrates automation using Terraform and Ansible.
- **Server `s-2`**: Hosts Jenkins for CI/CD workflows.
- **Server `s-3`**: Runs Docker and deploys the Django Notes app.

---

## Pipeline Workflow

1. Provision infrastructure using **Terraform**.
2. Automate application deployment using **Ansible**.
3. Manage builds and integration with **Jenkins**.
4. Deploy the Django Notes app on **Docker** containers.
5. Trigger pipeline using **GitHub Webhooks**.

---

## Steps Involved

### 1. Provision Infrastructure with Terraform

- **Provisioned Infrastructure**: 
  - Deployed server `s-1` and installed Ansible for orchestration.
- **Terraform Setup**: 
  - Configured Terraform on `s-1` to provision additional servers.
- **Server Creation**: 
  - Used Terraform to provision servers `s-2` (Jenkins) and `s-3` (Docker).

---

### 2. Jenkins and Docker Installation

- **Jenkins Installation**: 
  - Installed and configured Jenkins on `s-2` for automation and CI/CD workflows.
- **Docker Setup**: 
  - Installed Docker and Docker Compose on `s-3` for managing containers.

---

### 3. Ansible Playbook for Deployment

- **Playbook Creation**: 
  - Developed `deploy-web.yml` on `s-1` to automate deployment tasks.
- **Deployment Automation**: 
  - Configured tasks to:
    - Clone code from GitHub.
    - Deploy the Django Notes app on `s-3` using Docker Compose.

---

### 4. Jenkins Pipeline Configuration

- **Pipeline Development**: 
  - Configured a Jenkins pipeline to deploy the Django Notes app on `s-3`.
- **Agent Configuration**: 
  - Set up server `s-1` as a build agent for Jenkins using Ansible.
- **GitHub Integration**: 
  - Configured GitHub Webhooks to trigger the pipeline on code commits.

---

### 5. Django Notes App Deployment
This is a simple notes app built with React and Django.

## Requirements
1. Python 3.9
2. Node.js
3. React

## Installation
1. Clone the repository
```
git clone https://github.com/LondheShubham153/django-notes-app.git
```

2. Build the app
```
docker build -t notes-app .
```

3. Run the app
```
docker run -d -p 8000:8000 notes-app:latest
```

## Nginx

Install Nginx reverse proxy to make this application available

`sudo apt-get update`
`sudo apt install nginx`
---

### 6. CI/CD Pipeline Execution and Automation

- **Automated Execution**: 
  - Used Jenkins to trigger Ansible playbooks (`deploy-web.yml`) for deployments.
- **Webhook Configuration**: 
  - Set up GitHub Webhooks to automatically execute the pipeline on new commits.
- **Deployment Monitoring**: 
  - Monitored and validated deployments to ensure seamless updates.

---

## Outcome

🎯 **Successfully implemented a comprehensive and automated pipeline** that integrates Jenkins, Terraform, Ansible, and Docker to achieve efficient continuous integration, delivery, and deployment of the Django Notes app.

---

## Technology Stack

- **CI/CD**: Jenkins
- **Infrastructure Provisioning**: Terraform
- **Configuration Management**: Ansible
- **Containerization**: Docker and Docker Compose
- **Version Control**: GitHub
- **Programming Language**: Python (Django Notes App)

---

## Project Structure

```
.
├── terraform/
│   ├── main.tf            # Terraform configuration for infrastructure provisioning
│   ├── variables.tf       # Input variables for Terraform
├── ansible/
│   ├── deploy-web.yml     # Ansible playbook for deployment automation
│   ├── inventory.ini      # Inventory file for managing servers
├─── docker-compose.yml # Docker Compose file for Django Notes app
├── Dockerfile         # Dockerfile for building application image
├── jenkins/
│   ├── Jenkinsfile        # Jenkins pipeline definition
├── django-notes-app/      # Source code for Django Notes application
│   ├── manage.py          # Django management script
│   ├── requirements.txt   # Python dependencies
```

---

## How to Run

1. **Provision Servers**: Use `main.tf` with Terraform to create servers `s-1`, `s-2`, and `s-3`.
2. **Run Ansible Playbook**: Execute `deploy-web.yml` to set up Jenkins, Docker, and deploy the app.
3. **Configure Jenkins**: 
   - Set up a Jenkins pipeline with the provided `Jenkinsfile`.
   - Link GitHub repository with Webhooks for automation.
4. **Access the Application**: 
   - Application is deployed and available on `http://<server-s3-ip>:<port>`.

---

## Contact

Feel free to reach out for further details or queries!

