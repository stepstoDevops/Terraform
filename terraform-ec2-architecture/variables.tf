variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default     = "example-vpc"
}

variable "subnet_count" {
  description = "Number of subnets to create"
  type        = number
  default     = 2
}

variable "subnet_name" {
  description = "Base name for the subnets"
  type        = string
  default     = "example-subnet"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "security_group_name" {
  description = "Name for the security group"
  type        = string
  default     = "example-security-group"
}

variable "instance_name" {
  description = "Name for the EC2 instance"
  type        = string
}
