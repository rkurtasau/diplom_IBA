resource "aws_instance" "test" {
  ami = "ami-0368b2c10d7184bc7"
  instance_type = "t3.micro" 
  subnet_id     = aws_subnet.public_subnet.id
}
