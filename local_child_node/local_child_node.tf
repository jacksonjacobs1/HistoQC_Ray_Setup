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
  name    = "child_node"
  command = ["/bin/bash", "/home/ray/HistoQC/docker_img_files/startup_child.sh", "172.17.0.2:6379"]
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