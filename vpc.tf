resource "aws_vpc" "First_VPC" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_internet_gateway" "First_IGW" {
  vpc_id = aws_vpc.First_VPC.id
}


resource "aws_route" "rt1" {
  route_table_id         = aws_vpc.First_VPC.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.First_IGW.id
}



