terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
resource "aws_iam_user" "newuser" {
  name = "tfuser"
  path = "/"

  tags = {
    addedby = "terraform"
  }
}
resource "aws_iam_user_login_profile" "newuserprofile" {
  user    = aws_iam_user.newuser.name
  pgp_key = "keybase:<ACCOUNT NAME>"
  password_reset_required = true
}

output "password" {
  value = aws_iam_user_login_profile.newuserprofile.encrypted_password
}
resource "aws_iam_user_group_membership" "addadmingroup" {
  user = aws_iam_user.newuser.name

  groups = [
    "Administrator",
  ]
}
