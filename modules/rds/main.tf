# RDS Database Subnet Group
resource "aws_db_subnet_group" "wordpress_db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.db_subnet_group_name
  }
}

# RDS Instance
resource "aws_db_instance" "wordpress_db" {
  identifier           = var.db_identifier
  allocated_storage    = var.db_allocated_storage
  storage_type         = var.db_storage_type
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.db_parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name = aws_db_subnet_group.wordpress_db_subnet_group.name
}