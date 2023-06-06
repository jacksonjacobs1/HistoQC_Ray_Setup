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
  image   = "cluster_boilerplate"
  name    = "head_node"
  command = ["/bin/bash", "/home/ray/HistoQC/docker_img_files/startup_head.sh"]
  ports {
    internal = 80
    external = 8050
  }

  volumes {
    volume_name    = "shared_volume"
    container_path = "/home/ray/shared_volume"
    read_only = false
  }
}

# Create a volume to share data between containers. Only needs to be created once.
resource "docker_volume" "shared_volume" {
  name = "shared_volume"
}