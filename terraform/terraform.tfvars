aws_region       = "eu-north-1"
key_name         = "cloud-devops-lab-2025-key"     # CHANGE to your EC2 key pair name
your_ip_cidr     = "0.0.0.0/0"      # CHANGE to your public IP/32
project          = "cloud-devops-lab-2025-key"
env              = "dev"
vpc_cidr         = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
instance_type    = "t3.micro"
root_volume_size_gb = 10  # set >= 6 (e.g., 10)