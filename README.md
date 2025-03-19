# 🌐 AWS VPC Automation using Terraform

## 📌 Project Overview
This project deploys an **AWS Application Load Balancer (ALB)** to distribute incoming traffic between two **EC2 instances** across different **Availability Zones**. The infrastructure is provisioned using **Terraform** for automation and scalability.

---

## 🏗️ Architecture
The setup consists of:

🔹 **VPC** with two **public subnets** in different **Availability Zones**  
🔹 **Internet Gateway** for external access  
🔹 **Route Tables** for directing traffic  
🔹 **Security Groups** to control network access  
🔹 **Application Load Balancer (ALB)** for traffic distribution  
🔹 **Target Group** to register EC2 instances  
🔹 **EC2 Instances** running across multiple zones  

### 📌 Architecture Diagram  
![Design Architecture](https://raw.githubusercontent.com/Chanidu26/aws-vpc-terraform/refs/heads/main/figures/Design.jpg)

---

## 🚀 Infrastructure Components

### **1️⃣ Virtual Private Cloud (VPC)**
✅ Creates an isolated network environment  
✅ Includes two **public subnets**  

### **2️⃣ Subnets**
✅ **Public Subnet 1** in **Availability Zone 1**  
✅ **Public Subnet 2** in **Availability Zone 2**  

### **3️⃣ Internet Gateway & Route Tables**
✅ **Internet Gateway** attached to allow public access  
✅ **Route tables** configured to direct traffic to the internet  

### **4️⃣ Security Groups**
✅ **ALB Security Group** - Allows inbound **HTTP (Port 80)** traffic  
✅ **EC2 Security Group** - Allows **only ALB-originated HTTP traffic**  

### **5️⃣ Application Load Balancer (ALB)**
✅ Listens on **port 80** and forwards requests to **EC2 instances**  
✅ Associated with a **Target Group** for load distribution  

### **6️⃣ Target Group**
✅ Registers the two **EC2 instances**  
✅ **Health checks** configured to ensure instance availability  

### **7️⃣ EC2 Instances**
✅ Two EC2 instances deployed in different zones  
✅ Registered with the **Target Group** for load balancing  

---

## 🛠️ Terraform Configuration

### **1️⃣ Backend Configuration (State Management)**
To securely manage Terraform state, we use **S3** with **DynamoDB** for state locking.

```hcl
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "alb/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "your-terraform-state-lock-table"
    encrypt        = true
  }
}
