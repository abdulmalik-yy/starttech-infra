module "networking" {
  source = "./modules/networking"
}

module "compute" {
  source                    = "./modules/compute"
  vpc_id                    = module.networking.vpc_id
  public_subnet             = [module.networking.public_subnet]
  private_subnet            = [module.networking.private_subnet]
  iam_instance_profile_name = module.monitoring.iam_instance_profile_name
}

module "storage" {
  source         = "./modules/storage"
  vpc_id         = module.networking.vpc_id
  private_subnet = [module.networking.private_subnet]
  ec2_sg         = module.compute.ec2_sg_id
}

module "monitoring" {
  source = "./modules/monitoring"
}