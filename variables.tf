variable "db_username" {
  description = "The username for the RDS database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  sensitive   = true
}

variable "aws_key_name" {
  description = "The name of the AWS key pair"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
  sensitive   = true
}