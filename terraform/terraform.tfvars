# terraform.tfvars

# Remplacer avec vos propres informations
proxmox_api_url          = "https://192.168.0.91:8006/" # Mettre l'IP ou le nom d'un de vos nœuds
proxmox_api_token_id     = "terraform-prov@pve!mytoken"
proxmox_api_token_secret = "4219c540-196c-40a4-9ac7-626e1f72be4c"
proxmox_nodes            = ["pve-1", "pve-2"] # Mettre les noms exacts de vos noeuds

template_name            = "local:jammy-server-cloudimg-amd64.img"

# Collez ici votre clé SSH publique (le contenu de ~/.ssh/id_rsa.pub)
ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP+FtGsz3XkYbLfCKEa1WLiXn/817hQ+g1tG0rGkPzCB zeta@pop-os"

# Network configuration
network_cidr             = "192.168.0.0/24"
network_gateway          = "192.168.0.1"
network_dns_servers      = ["8.8.8.8"]
ip_start_index           = 100 # IP starts at 192.168.10.100

vm_start_id = 900

# ressources
master_cores = 4
master_memory = 4092
worker_cores = 6
worker_memory = 14192

vm_user = "ubuntu"
vm_password = "password"
