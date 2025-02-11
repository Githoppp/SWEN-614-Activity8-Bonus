output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.wordpress_ec2.public_ip
}