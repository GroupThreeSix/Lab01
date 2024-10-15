variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "The name for the key pair. Conflicts with `key_name_prefix`"
  type        = string
  default     = null
}

variable "key_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with `key_name`"
  type        = string
  default     = null
}

variable "public_key" {
  description = "The public key material"
  type        = string
  default     = ""
}

variable "create_private_key" {
  description = "Determines whether a private key will be created"
  type        = bool
  default     = false
}