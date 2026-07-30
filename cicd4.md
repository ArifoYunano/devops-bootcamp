GHCR, Self-Hosted Runner, & Auto-Deploy

1. GHCR (GitHub Container Registry)

What it is: GitHub’s built-in service for storing and managing Docker container images (a replacement/alternative to Docker Hub).

Role: Serves as a centralized repository where CI pipeline publishes built container images.

Key Benefit: Integrated directly into GitHub, meaning you can authenticate automatically using GITHUB_TOKEN without needing third-party registry accounts.

2. Self-Hosted Runner

What it is: A machine (cloud server, local desktop, virtual machine, or Kubernetes cluster) that you own, manage, and connect to GitHub Actions to execute workflow jobs.

Role: Instead of using GitHub’s default cloud servers (GitHub-hosted runners), custom machine runs the job steps (e.g., building code or running deployment commands).

Key Benefit: Provides complete control over hardware, operating system, network security (e.g., access to internal private VPCs), and cached dependencies to speed up builds.

3. Auto-Deploy (Automated Deployment)
What it is: The practice of automatically deploying code or application updates to a target environment (like staging or production) as soon as new code is pushed or merged.

Role: Eliminates manual deployment steps (such as manually SSHing into a server or running docker pull manually).

Key Benefit: Accelerates delivery cycles, minimizes human error during deployment, and ensures production always reflects the latest tested code.

How They Work Together (Containerized CD Pipeline)
When combined, these three components form a modern, automated deployment architecture:

1. Developer pushes code to GitHub
       │
       ▼
2. Workflow triggers: Builds Docker Image  ──>  Pushes Image to [GHCR]
       │
       ▼
3. Job assigned to [Self-Hosted Runner]
       │
       ▼
4. Runner executes [Auto-Deploy]:
   Pulls new image from GHCR  ──>  Restarts container  ──>  Live in Production!

Build & Package: Code changes trigger a GitHub Actions workflow that builds app into a Docker container and pushes it to GHCR.

Trigger Runner: GitHub notifies Self-Hosted Runner (which sits inside private infrastructure/server) to run the deployment job.

Auto-Deploy Execution: The Self-Hosted Runner pulls the freshly built image from GHCR, stops the old container, and starts the new one—completing the Auto-Deploy process without any manual intervention.
