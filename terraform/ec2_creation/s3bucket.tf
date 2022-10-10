resource "aws_s3_bucket" "ec2s3" {
  bucket = "ec2s3bucket1.tf"
  tags = {
    Name        = "jenkins-ansible"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "upload" {
  bucket = aws_s3_bucket.ec2s3.id
  key = "s3-Saibaba.jpg"
  source = "/home/jenkins/Saibaba.jpg"
}

