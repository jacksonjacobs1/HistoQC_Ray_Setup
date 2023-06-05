# HistoQC + Ray

## Description
Infrastructure for running HistoQC using a ray-ified local docker cluster.

## Usage
1. Clone the repository
```bash
git clone https://github.com/jacksonjacobs1/HistoQC_Ray_Setup.git
```

2. Install Terraform CLI (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

3. Initialize head node
```bash
cd local_head_node
sudo terraform init
sudo terraform apply
```

4. Initialize child node
```bash
cd ../local_child_node
sudo terraform init
sudo terraform apply
```

## Troubleshooting
todo - info about docker container ip addresses



