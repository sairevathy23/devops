data "github_repository_file" "git-file" {
  provider   = github
  repository = "sairevathy23/devops"
  file       = "Saibaba.jpg"
}
 
resource "aws_s3_bucket" "ec2s3" {
    name = ec2s3bucket1
    tags = {
    Name        = "jenkins-ansible"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "upload" {
  bucket = "${aws_s3_bucket.ec2s3.id}"
  key = "s3-Saibaba.jpg"
  content = data.github_repository_file.git-file.content
}
