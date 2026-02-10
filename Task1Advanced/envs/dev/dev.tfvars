# ─── DEV Environment ───
environment = "dev"
vm_name     = "future2-dev-vm"
cores       = 2
memory      = 4
disk_size   = 30
disk_type   = "network-hdd"
zone        = "ru-central1-a"
subnet_id   = "e9b3xxxxxxxxxxxxxx"
ssh_key     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5... dev@future2.local"

labels = {
  team    = "platform"
  project = "future2"
}
