Terraform AWS Jenkins Infrastructure Project

Project Overview

This project demonstrates how to provision AWS infrastructure using Terraform and automatically install Jenkins on an EC2 instance using user_data scripts.

The entire infrastructure is created as code (Infrastructure as Code - IaC), making deployment repeatable, version-controlled, and automated.

---

Architecture

Terraform
    │
    ▼
AWS Cloud
│
├── VPC
│
├── Public Subnet
│
├── Internet Gateway
│
├── Route Table
│
├── Security Group
│
└── EC2 Instance
      │
      └── Jenkins Installed Automatically

---

Project Objectives

- Learn Terraform fundamentals
- Create AWS infrastructure using code
- Understand Infrastructure as Code (IaC)
- Automate Jenkins installation
- Prepare for real-world DevOps projects
- Gain hands-on experience with AWS networking

---

Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- AWS Security Groups
- AWS Route Tables
- Jenkins
- Linux (Ubuntu)
- Git & GitHub

---

Project Structure

terraform-jenkins-project/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── userdata.sh
└── .gitignore

---

AWS Resources Created

VPC

Purpose:

- Provides isolated network environment.
- All project resources reside inside this VPC.

Example CIDR:

10.0.0.0/16

---

Public Subnet

Purpose:

- Hosts Jenkins EC2 instance.
- Accessible from the internet.

Example:

10.0.1.0/24

---

Internet Gateway

Purpose:

- Enables internet connectivity for resources inside VPC.

---

Route Table

Purpose:

- Routes internet traffic through Internet Gateway.

Example Route:

0.0.0.0/0 → Internet Gateway

---

Security Group

Purpose:

- Acts as a virtual firewall.

Allowed Ports:

Port| Protocol| Purpose
22| TCP| SSH
80| TCP| HTTP
8080| TCP| Jenkins

---

EC2 Instance

Purpose:

- Hosts Jenkins server.

Example Instance Type:

t2.micro

Free Tier Eligible.

---

Jenkins Installation Using user_data

Terraform automatically executes the user_data script during EC2 launch.

Example:

#!/bin/bash

sudo apt update -y
sudo apt install openjdk-17-jdk -y

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
| sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ \
| sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y
sudo apt install jenkins -y

sudo systemctl enable jenkins
sudo systemctl start jenkins

---

Terraform Workflow

Initialize Terraform

terraform init

Downloads required providers.

---

Validate Configuration

terraform validate

Checks syntax errors.

---

Review Infrastructure

terraform plan

Shows resources Terraform will create.

---

Create Infrastructure

terraform apply

Creates AWS resources.

---

Destroy Infrastructure

terraform destroy

Deletes all resources.

---

Access Jenkins

Get Public IP:

terraform output

Open Browser:

http://<public-ip>:8080

Retrieve Jenkins Password:

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

---

Terraform State File

Terraform maintains infrastructure state in:

terraform.tfstate

Purpose:

- Tracks deployed resources
- Maps Terraform configuration to AWS resources
- Used during updates and destroys

Important:

Never push state files to GitHub.

---

.gitignore

.terraform/
*.tfstate
*.tfstate.*
terraform.tfvars
.terraform.lock.hcl

---

Key Terraform Concepts

Provider

A plugin that allows Terraform to communicate with cloud providers.

Example:

provider "aws" {
  region = "ap-south-1"
}

---

Resource

Represents an AWS object.

Example:

resource "aws_instance" "jenkins" {
}

---

Variable

Used for reusable values.

Example:

variable "instance_type" {
}

---

Output

Displays information after deployment.

Example:

output "public_ip" {
}

---

CI/CD Integration

Future enhancements:

GitHub → Jenkins → Docker → ECR → Kubernetes

Pipeline Flow:

Developer
    │
GitHub
    │
Jenkins
    │
Build
    │
Docker Image
    │
ECR
    │
Kubernetes
    │
Application Deployment

---

Real-Time Industry Usage

Terraform is commonly used for:

- Infrastructure provisioning
- Cloud automation
- Environment replication
- Disaster recovery
- Multi-region deployments
- CI/CD infrastructure setup

---

Interview Questions

What is Terraform?

Infrastructure as Code tool used to provision cloud resources.

What is State File?

File that stores resource mapping information.

What is user_data?

Script executed automatically when an EC2 instance launches.

Why Terraform instead of Manual AWS Setup?

- Faster
- Repeatable
- Version Controlled
- Less Human Error

Difference Between Terraform and CloudFormation?

Terraform:

- Multi-cloud

CloudFormation:

- AWS-only

What happens during terraform apply?

Terraform compares desired state with current state and creates required resources.

---

Resume Description

Designed and deployed AWS infrastructure using Terraform, including VPC, Public Subnet, Internet Gateway, Route Tables, Security Groups, and EC2 Instances. Automated Jenkins installation using user_data scripts and managed cloud resources using Infrastructure as Code principles.

---

Learning Outcomes

✔ Terraform Fundamentals

✔ AWS Networking

✔ Infrastructure as Code

✔ EC2 Automation

✔ Jenkins Installation

✔ State Management

✔ DevOps Project Experience

✔ Interview Preparation