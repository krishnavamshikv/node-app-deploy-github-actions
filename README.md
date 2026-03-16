# Cloud-Native DevSecOps Pipeline: Node.js on AWS ECS

[[Deploy to Amazon ECS]](https://github.com/krishnavamshikv/node-app-deploy-github-actions/actions)

This project demonstrates a production-grade **CI/CD GitOps pipeline** for a containerized Node.js microservice. It leverages AWS serverless infrastructure (Fargate) and implements a "Shift-Left" security strategy.

## 🚀 Architecture
The pipeline automates the entire lifecycle of the application:
1. **CI Stage:** Code linting and Multi-stage Docker build.
2. **Security Stage:** Vulnerability scanning of the Docker image using **Trivy**.
3. **Registry Stage:** Pushing the hardened image to **Amazon ECR**.
4. **CD Stage:** Automated rolling deployment to **AWS ECS Fargate** behind an Application Load Balancer.

## 🛠 Tech Stack
- **Runtime:** Node.js (Express)
- **Containerization:** Docker (Multi-stage builds)
- **CI/CD:** GitHub Actions
- **Cloud:** AWS (ECS, ECR, Fargate, CloudWatch)
- **Security:** Trivy (Vulnerability Scanning)

## 🔒 Key Security Features
- **Vulnerability Management:** Integrated **Trivy** to scan images. Successfully identified and mitigated **CVE-2026-22184** (Critical zlib overflow) by implementing an OS-level patch strategy during the build phase.
- **Least Privilege:** Configured IAM Execution Roles to restrict container permissions to only necessary AWS services.
- **Rootless Container:** Optimized Dockerfile to run the application as a non-root `node` user to prevent privilege escalation.
- **Secret Management:** Utilized GitHub Actions Secrets to handle sensitive AWS credentials, ensuring zero exposure in version control.

## 📦 Project Structure
```text
├── .github/workflows/
│   └── deploy.yml        # CI/CD Pipeline Definition
├── main.js               # Express.js Application code
├── Dockerfile            # Multi-stage production Dockerfile
├── task-def.json         # AWS ECS Task Definition template
├── package.json          # Node dependencies
└── README.md
