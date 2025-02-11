output "ec2_public_ip" {
  value       = module.ec2.public_ip
  description = "The public IP address of the WordPress EC2 instance"
}

output "rds_endpoint" {
  value       = module.rds.db_endpoint
  description = "The endpoint of the WordPress RDS instance"
}