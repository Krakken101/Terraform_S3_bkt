
provider "aws" {
  region = "us-west-2"
}

variable "event_themes" {
  default = ["AdventureTech", "NatureEscape", "DataSummit", "CodeCarnival"]
}

# Initials (replace with your own initials)
variable "initials" {
  default = "BB"
}


resource "aws_s3_bucket" "event_buckets" {
  count = length(var.event_themes)

  bucket = "${var.event_themes[count.index]}-${var.initials}-bucket"
  acl = "private"
}


output "bucket_names" {
  value = [for bucket in aws_s3_bucket.event_buckets : bucket.bucket]
}
