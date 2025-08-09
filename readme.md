<h2>Provision NGINX Docker Container using Terraform</h2>

This project shows how to use Terraform to provision a local Docker container running NGINX, demonstrating Infrastructure as Code (IaC) concepts.

### Objective

  Provision a local Docker container running the NGINX web server using Terraform.

### Tools Required

* Docker ( Must be installed and running )
* Terraform ( Must be installed )
  
### Project Structure 
```
terraform-docker-demo/
├── main.tf         # Terraform configuration file
└── (your Terraform state files will appear after run)
```

## Getting Started

1. Clone or Create Your Project Directory 
```
mkdir terraform-docker-demo
cd terraform-docker-demo
```

2. Create Your Terraform Configuration 
```
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine" # For Windows without TCP
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name  = "nginx-container"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 8081
  }
}
```

3. Terraform Workflow

Initialize Terraform
```
terraform init 
```
Previeww the Infrastructure Plan 
```
terraform plan 
```
Apply the Configuration
```
terraform apply
# Type 'yes' to confirm when promoted
```
Verify Docker Container
```
docker ps 
# Should show 'mynginx' running, mapped to port 8080

```

Inspect Terraform State

```
terraform state list 
```

Destroy the Infrastructure 

```
terraform destroy 
# Type 'yes' to confirm when promoted
```

## Summary table 
    |--------------------------|----------------------|---------------------------------|
    | Step                     | Command              | Purpose                         |
    |--------------------------|----------------------|---------------------------------|
    | Initialize Terraform     | terraform init       | Provide setup                   |
    | Preview Plan             | terraform plan       | See proposed infra changes      |
    | Apply Configuration      | terraform apply      | Create Docker image/container   |
    | List Managed Resources   | terraform state list | Show Terraform-managed infra    |
    | Destroy Infrastructure   | terraform destroy    | Remove everything created       |
    | (Docker CLI alternative) | docker run ...       | Run container directly (no IaC) |
    |--------------------------|----------------------|---------------------------------|



## Outcome
By following these steps, you will:
* Learn how to use Terraform and its Docker provider to provision a container from code.
* Understand the key Terraform workflow: init, plan, apply, inspect, destroy.
* Gain experience with basic container provisioning for local development and testing.
  
## Troublshooting 

* Make sure Docker is running and your user has correct permissions (you may need sudo on some systems)
* If you receive provider errors, ensure internet connection and the correct provider block in main.tf

## Contact or Ask Questions :

If you're stuck or would like to  extend this project ( e.g., mounting volumes, using different images), feel free to ask for help !

