# RunSuperMario
# **Terraform VPC, EC2, and Ansible Docker Setup**

## **Overview**
This project uses **Terraform** to provision a VPC with subnets, security groups, and EC2 instances. **Ansible** is then used to install Docker and run a container on these EC2 instances.

### **Infrastructure:**
- **VPC** with custom CIDR block
- **Subnets** in two availability zones
- **Security Groups** to allow SSH (port 22) and HTTP (ports 80, 8080)
- **EC2 Instances** running Docker containers

## **Prerequisites**
- **Terraform** (v1.0+)
- **Ansible** (v2.10+)
- **AWS CLI** (configured)

## **Setup Steps**

### 1. Clone the Repo
```bash
git clone https://github.com/YourUsername/RunSuperMario.git
cd RunSuperMario
