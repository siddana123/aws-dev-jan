variable "vpc_cidr" {
  type        = string
  default     = "172.24.0.0/16"
  description = "default vpc_cidr_block"
}
variable "availability_zone_sub1" {
  type        = string
  default     = "us-east-1a"
  description = "availability zone for subnet1"
}
variable "availability_zone_sub2" {
  type        = string
  default     = "us-east-1b"
  description = "availability zone for subnet2"
}
variable "availability_zone_sub3" {
  type        = string
  default     = "us-east-1c"
  description = "availability zone for subnet3"
}
variable "rt_cidr_block" {
  type        = string
  default     = "0.0.0.0/0"
  description = "The value of route cidr block"
}
variable "pvt_sub_rt_name" {
  type        = string
  default     = "Private subnet route table"
  description = "The value of route cidr block"
}
variable "pub_sub_rt_name" {
  type        = string
  default     = "Public subnet route table"
  description = "The value of route cidr block"
}
variable "igw_name" {
  type        = string
  default     = "igw"
  description = "The name internet gatway"
}
variable "map_public_ip_on_launch_pub_sub" {
  type        = string
  default     = "true"
  description = "The value of map_public_ip_on_launch_pub_sub"
}
variable "map_public_ip_on_launch_pvt_sub" {
  type        = string
  default     = "false"
  description = "The value of map_public_ip_on_launch_pub_sub"
}
variable "tenancy" {
  default = "default"
}
variable "vpc_id" {}

#variable "subnet_cidr" {}
variable "pub_sub1_cidr_block" {
  type    = string
  default = "172.24.1.0/24"
  description = "The cidr block value of public subnet1"
}
variable "pub_sub2_cidr_block" {
  type    = string
  default = "172.24.2.0/24"
  description = "The cidr block value of public subnet2"
}
variable "pub_sub3_cidr_block" {
  type    = string
  default = "172.24.3.0/24"
  description = "The cidr block value of public subnet3"
}
variable "prv_sub1_cidr_block" {
  type    = string
  default = "172.24.4.0/24"
  description = "The cidr block value of private subnet1"
}
variable "prv_sub2_cidr_block" {
  type    = string
  default = "172.24.5.0/24"
  description = "The cidr block value of private subnet2"
}
variable "prv_sub3_cidr_block" {
  type    = string
  default = "172.24.6.0/24"
  description = "The cidr block value of private subnet3"
}
variable "vpc_name" {
  description = "Value of the vpc name"
  type        = string
}
variable "pub_sub1_name" {
  description = "Value of the tag name"
  type        = string
  default     = "public subnet1"
}
variable "pub_sub2_name" {
  description = "Value of the tag name"
  type        = string
  default     = "public subnet2"
}
variable "pub_sub3_name" {
  description = "Value of the tag name"
  type        = string
  default     = "public subnet3"
}
variable "pvt_sub1_name" {
  description = "Value of the tag name"
  type        = string
  default     = "private subnet1"
}
variable "pvt_sub2_name" {
  description = "Value of the tag name"
  type        = string
  default     = "private subnet2"
}
variable "pvt_sub3_name" {
  description = "Value of the tag name"
  type        = string
  default     = "private subnet3"
}
variable "environment" {
  description = "Value of the tag environment"
  type        = string
}

variable "jira_id" {
  description = "Value of the tag jira_id"
  type        = string
}
variable "approved_by" {
  description = "Value of the tag approved_by"
  type        = string
}
variable "project_owner" {
  description = "Value of the tag project_owner"
  type        = string
}
variable "created_by" {
  description = "Value of the tag created_by"
  type        = string
}