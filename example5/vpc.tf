resource aws_vpc "vpc"{

    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
}


resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.example-vpc.id
  cidr_block = "10.0.1.0/24"


}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.example-vpc.id

}

