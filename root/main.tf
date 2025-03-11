
module "networking" {
  source = "../modules/networking"

}

module "client" {
  source = "../modules/client"
}

module "server" {
  source = "../modules/server"
}

