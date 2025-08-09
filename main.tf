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
