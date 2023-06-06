# HistoQC + Ray

## Description
Infrastructure for running HistoQC using a ray-ified local docker cluster.

## Usage
1. Clone the repository
```bash
git clone https://github.com/jacksonjacobs1/HistoQC_Ray_Setup.git
```

2. Install Terraform CLI (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

3. Navigate to the HistoQC_Ray_Setup directory and build the docker image
```bash
docker build -t cluster_boilerplate ./Dockerfile
```

4. Initialize head node
```bash
cd local_head_node
sudo terraform init
sudo terraform apply
```

5. Initialize child node
```bash
cd ../local_child_node
sudo terraform init
sudo terraform apply
```

These scripts will perform the following tasks:
- Create a docker volume
- Create a head_node docker container 
- Create a child_node docker container
- Initialize respective ray head and child nodes, connected by a Ray cluster.

6. Add images to the shared docker volume. The shared volume is mounted to the head node and child node containers. Images added to the shared volume will be accessible to both containers.

The shared volume should have the following file structure:
```
shared_volume
|_ raw
|_ runs
```

Images should be stored in shared_volume/raw

7. Run HistoQC

Connect to the head node container
```bash
docker exec -it head_node bash
```

In the container terminal, run HistoQC
```bash
python -m histoqc -c light -n 2 -o /home/ray/shared_volume/runs/ray_test1 /home/ray/shared_volume/raw/*.tif
```


## Troubleshooting
todo - info about docker container ip addresses

