resource "aws_s3_bucket" "main_s3_bucket" {
  bucket = "main_s3_bucket"

  tags = {
    Name        = "s3bucket"
  }
}
