module "keypair" {
  source             = "./modules/keypair"
  key_name           = var.key_name
  create_private_key = true
}