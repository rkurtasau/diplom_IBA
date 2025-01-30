resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Main AWS Virtual Private Cloud"
  }
}

resource "null_resource" "vpc_flow_logs" {

}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id     = aws_vpc.main_vpc.id
  depends_on = [aws_vpc.main_vpc]
  tags = {
    Name = "Internet Gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id     = aws_vpc.main_vpc.id
  depends_on = [aws_vpc.main_vpc]
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/26"
  depends_on = [aws_vpc.main_vpc]
  tags = { 
    Name = "Public Subnet"
  }
}

resource "aws_route_table_association" "public_associate" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
  depends_on     = [aws_route_table.public_rt, aws_subnet.public_subnet]
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id
}
