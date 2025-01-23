resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Main AWS Virtual Private Cloud"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id
  depends_on = [aws_vpc.main.vpc]
} 

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/26"
  depends_on = [aws_vpc.main_vpc]
  tags = {
    Name = "Public Subnet"
  }
}

