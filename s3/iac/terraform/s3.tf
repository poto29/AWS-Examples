resource "aws_s3_bucket" "my-first-bucket-with-terraform-2904" {
  bucket = "my-first-bucket-with-terraform-2904"

  tags = {
    Name        = "my-first-bucket-with-terraform-2904"
    Environment = "Dev"
  }
}