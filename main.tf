provider "scaleway" {
  region = "${var.region}"
  organization = "${var.organization}"
  token        = "${var.scw_token}"
}

data "scaleway_image" "terraformruben" {
  architecture = "x86_64"
  name         = "Ubuntu Bionic"
}

resource "scaleway_server" "terraformruben" {
  name  = "terraformruben"
  image = "${data.scaleway_image.terraformruben.id}"
  type  = "START1-S"
}
resource "scaleway_ip" "ip" {
  server = "${data.scaleway_server.terraformruben.id}"
}


resource "scaleway_volume" "terraformruben" {
  name       = "terraformrubenvolume"
  size_in_gb = 50
  type       = "l_ssd"
}

