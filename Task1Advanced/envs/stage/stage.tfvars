# ─── STAGE Environment ───
environment = "stage"
vm_name     = "future2-stage-vm"
cores       = 4
memory      = 8
disk_size   = 80
disk_type   = "network-ssd"
zone        = "ru-central1-b"
subnet_id   = "e2lbxxxxxxxxxxxxxx"
ssh_key     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5... stage@future2.local"

labels = {
  team    = "platform"
  project = "future2"
}
