resource "aws_instance" "wordpress_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.ec2_sg_id]
  key_name               = var.key_name

  # User data script for WordPress setup
  # user_data = filebase64("wp_rds_install.sh")
  user_data = var.user_data


  tags = {
    Name = var.instance_name
  }
}