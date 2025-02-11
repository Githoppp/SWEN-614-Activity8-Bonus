variable "db_identifier" {}
variable "db_allocated_storage" {}
variable "db_storage_type" {}
variable "db_engine" {}
variable "db_engine_version" {}
variable "db_instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "db_parameter_group_name" {}
variable "skip_final_snapshot" {}
variable "vpc_security_group_ids" {
  type = list(string)
}
variable "db_subnet_group_name" {}
variable "subnet_ids" {
  type = list(string)
}