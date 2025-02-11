variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be deployed"
  type        = string
}

variable "ec2_sg_id" {
  description = "Security Group ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "SSH Key Name for EC2 access"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "user_data" {
  description = "The user data script for EC2 initialization"
  type        = string
  default     = null
}