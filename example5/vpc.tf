resource aws_vpc "vpc"{

    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {
      Name = "VPC - ${var.NAME} "
  }
}


resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Subnet - ${var.NAME} "
  }


}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "IG - ${var.NAME} "
  }

}

resource "aws_eip" "eip" {
  instance = aws_instance.vm-terraform.id
  vpc      = true

  tags = {
    Name = "EIP - ${var.NAME} "
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  
   tags = {
    Name = "Route Table - ${var.NAME} "
  }
}


resource "aws_main_route_table_association" "route-table-association" {
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.route_table.id
}