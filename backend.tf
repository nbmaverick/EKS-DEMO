terraform {
  backend "s3" {
    bucket = "mybucket-sultan-94"
    key    = "nur/hands-on/folders/EKS-DEMO"
    region = "us-east-2"
  }
}