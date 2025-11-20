terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.21.0"
    }
  }
}

resource "aws_s3_bucket" "default" {

}

# resursa asta nu cunoaste ce am eu exact in fisiere (in obiecte)
# daca eu doar schimb continutul unui obiect, de ex fisier, terraform nu o va lua ca pe o schimbare la terraform plan
# trebuie sa mentionam noi ca e schimbat
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.default.id
  key    = "myfile.txt"
  source = "myfile.txt"

  # daca mentionam etag ul, acum va vedea modificarile, se va lua dupa etag ul modificat
  etag = filemd5("myfile.txt")
}