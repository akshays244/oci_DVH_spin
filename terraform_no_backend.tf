
provider "oci" {
  region = "us-ashburn-1"
}

resource "oci_core_vcn" "example_vcn" {
  compartment_id = "ocid1.compartment.oc1..exampleuniqueID"
  cidr_block     = "10.0.0.0/16"
  display_name   = "example_vcn"
}
