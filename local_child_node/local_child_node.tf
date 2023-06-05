terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# resource "docker_image" "ray" {
#   name         = "rayproject/ray"
#   keep_locally = false

# }

resource "docker_container" "ray" {
  image   = "jackson/rayexperimental:histoqc"
  name    = "child"
  command = ["/bin/bash", "/home/ray/startup_child.sh"]
  # command = ["tail", "-f", "/dev/null"]
  ports {
    internal = 80
    external = 8080
  }

  # define volumes
  volumes {
    volume_name    = "shared_volume"
    container_path = "/home/ray/shared_volume"
    read_only      = false
  }
}