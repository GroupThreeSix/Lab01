module "keypair" {
  source             = "./modules/keypair"
  key_name           = var.key_name
  create_private_key = true
}

resource "local_file" "private_key" {
  content  = module.keypair.private_key_pem
  filename = "${path.module}/${var.key_name}.pem"
  file_permission = "0600"
}