variable "vpc_id" {
  description = "The ID of the VPC where security groups will be created"
  type        = string
}

variable "ec2_sg_name" {
  description = "Name for the EC2 security group"
  type        = string
}

variable "rds_sg_name" {
  description = "Name for the RDS security group"
  type        = string
}