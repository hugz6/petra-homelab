# terraform.tfvars

proxmox_api_url          = "https://192.168.0.91:8006/"
proxmox_api_token_id     = "terraform-prov@pve!mytoken"
proxmox_nodes            = ["pve-1", "pve-2"]

template_name            = "local:jammy-server-cloudimg-amd64.img"

# Network configuration
network_cidr             = "192.168.0.0/24"
network_gateway          = "192.168.0.1"
network_dns_servers      = ["8.8.8.8"]
ip_start_index           = 100 # IP starts at 192.168.10.100

vm_start_id = 900

# ressources
master_cores = 4
master_memory = 7000
master_count = 1

worker_cores = 6
worker_memory = 14192
worker_count = 3

vm_user = "ubuntu"
vm_password = "password"
