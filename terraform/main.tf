module "vpc" {
  source = "./modules/vpc" 
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id
  security_group_id = module.security_group.ec2_security_group_id
}

module "load_balancer" {
  source = "./modules/load_balancer"
  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id
  alb_security_group_id = module.security_group.alb_security_group_id
  vpc_id = module.vpc.vpc_id
  public_instance_1_id = module.ec2.public_instance_1_id
  public_instance_2_id = module.ec2.public_instance_2_id
}