# Provider Configuration
# Specifies the AWS provider and region for Terraform to manage resources in.
module "provider" {
  source = "./modules/provider"
  aws_region = "us-east-1"
}

# VPC and Networking Resources
# Create a VPC, subnets, and related networking infrastructure for WordPress.

module "vpc" {
  source                  = "./modules/vpc"
  vpc_cidr                = "10.0.0.0/16"
  vpc_name                = "WordPress VPC"
  public_subnet_cidr      = "10.0.1.0/24"
  public_subnet_az        = "us-east-1a"
  public_subnet_name      = "WordPress Public Subnet"
  public_subnet_2_cidr    = "10.0.2.0/24"    # New Subnet CIDR
  public_subnet_2_az      = "us-east-1b"    # New Subnet AZ
  public_subnet_2_name    = "WordPress Public Subnet 2"
  igw_name                = "WordPress Internet Gateway"
  public_rt_name          = "WordPress Public Route Table"
}


# Security Groups
# Defines security groups to control access for EC2 and RDS instances.

module "security_groups" {
  source       = "./modules/security_groups"
  vpc_id       = module.vpc.vpc_id
  ec2_sg_name  = "wordpress_ec2_sg"
  rds_sg_name  = "wordpress_rds_sg"
}


# EC2 Instance
# Launches an EC2 instance for WordPress and sets up user data.

# AMI Data Source, has been placed in the root data.tf file.


# WordPress EC2 Instance
module "ec2" {
  source         = "./modules/ec2"
  ami_id         = data.aws_ami.amazon_linux_2023.id
  instance_type  = "t2.micro"
  subnet_id      = module.vpc.public_subnet_id
  ec2_sg_id      = module.security_groups.ec2_sg_id
  key_name       = var.aws_key_name
  instance_name  = "WordPress EC2 Instance"
  user_data      = base64encode(templatefile("wp_rds_install.sh", {
    db_username   = var.db_username,
    db_password   = var.db_password,
    db_endpoint   = module.rds.db_endpoint,
    db_name       = var.db_name
  }))
}


# RDS Database
# Set up a MySQL RDS instance for WordPress.

module "rds" {
  source                  = "./modules/rds"
  db_identifier           = "wordpress-db"
  db_allocated_storage    = 20
  db_storage_type         = "gp2"
  db_engine               = "mysql"
  db_engine_version       = "8.0"
  db_instance_class       = "db.t3.micro"
  db_name                 = var.db_name
  db_username             = var.db_username
  db_password             = var.db_password
  db_parameter_group_name = "default.mysql8.0"
  skip_final_snapshot     = true
  vpc_security_group_ids  = [module.security_groups.rds_sg_id]
  db_subnet_group_name    = "wordpress_db_subnet_group"
  subnet_ids              = [module.vpc.public_subnet_id, module.vpc.public_subnet_2_id]
}


# Outputs
# Outputs the public IP of the EC2 instance and the RDS endpoint.

# module "outputs" {
#  source         = "./modules/outputs"
#  ec2_public_ip  = module.ec2.public_ip
#  rds_endpoint   = module.rds.db_endpoint
# }