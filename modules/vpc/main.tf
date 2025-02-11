# VPC Resource
resource "aws_vpc" "wordpress_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

# Public Subnet 1
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.wordpress_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.public_subnet_az
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name
  }
}

# Public Subnet 2 (new subnet in a different AZ)
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.wordpress_vpc.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.public_subnet_2_az
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_2_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "wordpress_igw" {
  vpc_id = aws_vpc.wordpress_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.wordpress_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wordpress_igw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

# Associate Public Subnet 1 with Public Route Table
resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Associate Public Subnet 2 with Public Route Table
resource "aws_route_table_association" "public_rta_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}
