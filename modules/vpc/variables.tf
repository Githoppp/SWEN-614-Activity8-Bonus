variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "WordPress VPC"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_az" {
  description = "The availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
  default     = "WordPress Public Subnet"
}

variable "public_subnet_2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_2_az" {
  description = "The availability zone for the second public subnet"
  type        = string
  default     = "us-east-1b"
}

variable "public_subnet_2_name" {
  description = "The name of the second public subnet"
  type        = string
  default     = "WordPress Public Subnet 2"
}

variable "igw_name" {
  description = "The name of the internet gateway"
  type        = string
  default     = "WordPress Internet Gateway"
}

variable "public_rt_name" {
  description = "The name of the public route table"
  type        = string
  default     = "WordPress Public Route Table"
}
