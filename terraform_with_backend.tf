
terraform {
  backend "oci" {
    compartment_ocid = "ocid1.compartment.oc1..exampleuniqueID"
    bucket           = "my-terraform-state-bucket"
    namespace        = "mynamespace"
    region           = "us-ashburn-1"
    key              = "terraform/terraform.tfstate"
  }
}

provider "oci" {
  region = "us-ashburn-1"
}

resource "oci_core_vcn" "example_vcn" {
  compartment_id = "ocid1.compartment.oc1..exampleuniqueID"
  cidr_block     = "10.0.0.0/16"
  display_name   = "example_vcn"
}
