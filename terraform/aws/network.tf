resource "aws_vpc" "prod-vpc" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = "10.1.0.0/16"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    "Name" = "prod"
  }
}

resource "aws_eip" "weather-eip" {
  public_ipv4_pool = "amazon"
  vpc              = true
}

resource "aws_subnet" "weather-pub-subnet" {
  assign_ipv6_address_on_creation = false
  availability_zone               = "us-west-2a"
  cidr_block                      = "10.1.4.0/24"
  map_public_ip_on_launch         = false
  vpc_id = aws_vpc.prod-vpc.id
}

resource "aws_subnet" "weather-priv-subnet" {
  assign_ipv6_address_on_creation = false
  availability_zone               = "us-west-2a"
  cidr_block                      = "10.1.1.0/24"
  map_public_ip_on_launch         = false
  vpc_id = aws_vpc.prod-vpc.id
}