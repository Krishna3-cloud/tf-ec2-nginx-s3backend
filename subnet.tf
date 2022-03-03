resource "aws_subnet" "Subnet_1" {
  vpc_id                  = aws_vpc.First_VPC.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet_1"
  }
}

resource "aws_subnet" "Subnet_2" {
  vpc_id                  = aws_vpc.First_VPC.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet_2"
  }
}

