module "network" {
  source     = "../terraform-network-module/v1"
  cidr_block = "10.1.0.0/16"
}

resource "null_resource" "security_group" {
  triggers = {
    subnet_ids = join(",", module.network.subnet_ids)
  }
}

output "vpc_id" {
  description = "VPC ID exported for downstream consumers."
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "Subnet IDs exported for downstream consumers."
  value       = module.network.subnet_ids
}
