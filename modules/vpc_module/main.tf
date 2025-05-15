variable "vpc_cidr" {}
variable "subnet_cidr" {}
variable "az" {}
variable "name_prefix" {}
variable "subnet_name" {}
variable "route_table_name" {}
variable "igw_name" {}
variable "subnet_association" { default = true }

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = { Name = "${var.name_prefix}-vpc" }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = { Name = var.igw_name }
}

resource "aws_subnet" "this" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = true
  tags = { Name = var.subnet_name }
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = { Name = var.route_table_name }
}

resource "aws_route_table_association" "this" {
  count          = var.subnet_association ? 1 : 0
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}
