provider "aws" {
    region = "us-east-1"
}
module "computemodule" {
 source = "./Compute/"
}

module "databasemodule" {
 source = "./Databases/"
}

module "Networkmodule" {
 source = "./Network/"
 
}

module "securitymodule" {
 source = "./Security/"
}

output "instanceid" {
    value = module.computemodule.instanceid
}

# output "EIP" {
#     value = module.computemodule.EIP
# }

# output "PublicIP" {
#   value = module.computemodule.PublicIP
# }

output "port" {
  value = module.databasemodule.port
}
output "resource_id" {
  value = module.databasemodule.resource_id
}

output "vpcid" {
  value = module.Networkmodule.vpcid
}