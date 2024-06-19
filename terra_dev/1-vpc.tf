resource "aws_vpc" "main" {
  # required
  cidr_block           = "192.168.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  # good finops practices
  assign_generated_ipv6_cidr_block = false
  # Optionnal, makes your instances shareed on the host
  instance_tenancy = "default"
  # logical segmentation
  tags = {
    Name = "main"
  }
}


output "vpc_id" {
  value       = aws_vpc.main.id
  description = "the VPC ID"
  sensitive   = false
}