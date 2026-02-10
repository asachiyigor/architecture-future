# ─── PROD Environment ───
environment = "prod"
vm_name     = "future2-prod-vm"
cores       = 8
memory      = 16
disk_size   = 200
disk_type   = "network-ssd"
zone        = "ru-central1-c"
subnet_id   = "b0cxxxxxxxxxxxxxx"
ssh_key     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5... prod@future2.local"

labels = {
  team    = "platform"
  project = "future2"
}
