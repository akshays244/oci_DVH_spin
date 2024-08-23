variable "tenancy_ocid" {
  description = "The OCID of the tenancy"
}

variable "user_ocid" {
  description = "The OCID of the user"
}

variable "fingerprint" {
  description = "The fingerprint for the API key"
}

variable "private_key_path" {
  description = "Path to the private key"
}

variable "region" {
  description = "The OCI region"
}

variable "compartment_ocid" {
  description = "The OCID of the compartment"
}

variable "availability_domain" {
  description = "The availability domain"
}

variable "image_ocid" {
  description = "The OCID of the image to use for instances"
}

variable "public_ssh_key_path" {
  description = "Path to the public SSH key"
}
