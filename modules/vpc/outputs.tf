output "vpc_id" {
  value       = aws_vpc.wordpress_vpc.id
  description = "The ID of the VPC"
}

output "public_subnet_id" {
  value       = aws_subnet.public_subnet.id
  description = "The ID of the public subnet"
}

output "public_subnet_2_id" {
  value       = aws_subnet.public_subnet_2.id
  description = "The ID of the second public subnet"
}
