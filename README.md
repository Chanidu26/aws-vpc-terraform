# AWS Application Load Balancer (ALB) with EC2 Instances

## 📌 Project Overview
This project deploys an **AWS Application Load Balancer (ALB)** to distribute incoming traffic between two **EC2 instances** deployed across different **Availability Zones**. The infrastructure is provisioned using **Terraform**.

## 🏗️ Architecture
The setup includes:
- **VPC** with two **public subnets** in different Availability Zones.
- **Internet Gateway** for external access.
- **Route Tables** configured for public subnets.
- **Security Groups** to control inbound/outbound traffic.
- **Application Load Balancer (ALB)** for traffic distribution.
- **Target Group** to register EC2 instances.
- **EC2 Instances** running in separate Availability Zones.

### 📌 Architecture Diagram
![Design Architecture](https://raw.githubusercontent.com/Chanidu26/aws-vpc-terraform/refs/heads/main/figures/Design.jpg)

## 🚀 Infrastructure Components
### **1️⃣ Virtual Private Cloud (VPC)**
- A VPC is created to isolate network resources.
- Includes two public subnets.

### **2️⃣ Subnets**
- **Public Subnet 1** in Availability Zone 1.
- **Public Subnet 2** in Availability Zone 2.

### **3️⃣ Internet Gateway & Route Tables**
- Internet Gateway is attached to allow public access.
- Route tables direct traffic from the subnets to the internet.

### **4️⃣ Security Groups**
- ALB Security Group: Allows inbound HTTP traffic.
- EC2 Security Group: Allows HTTP traffic from ALB only.

### **5️⃣ Application Load Balancer (ALB)**
- Listens on port `80` and forwards requests to EC2 instances.
- Associated with a **Target Group** for EC2 instances.

### **6️⃣ Target Group**
- Contains the two EC2 instances.
- Health checks are configured to verify instance availability.

### **7️⃣ EC2 Instances**
- Two EC2 instances are launched.
- Instances are registered with the Target Group.

## 🛠️ Terraform Configuration
### **1️⃣ Backend Configuration (State Management)**
To store Terraform state securely, use **S3** with **DynamoDB** for state locking.

# Clone the repository
git clone https://github.com/Chanidu26/aws-vpc-terraform
cd terraform

# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the changes
terraform apply -auto-approve

# Terraform Backend Configuration
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "alb/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "your-terraform-state-lock-table"
    encrypt        = true
  }
}
