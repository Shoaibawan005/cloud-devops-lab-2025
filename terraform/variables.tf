variable "project" {
  type        = string
  description = "DevOps Challenge"
  default     = "cloud-devops-lab-2025"
}

variable "env" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  default     = "10.0.2.0/24"
}

variable "key_name" {
  type        = string
  description = "Existing EC2 key pair name"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "your_ip_cidr" {
  type        = string
  description = "Your public IP in CIDR form for SSH to bastion (e.g., 1.2.3.4/32)"
}

variable "root_volume_size_gb" {
  type        = number
  description = "Root EBS volume size (GiB) for EC2 instances"
  default     = 10
}