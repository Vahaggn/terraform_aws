resource "aws_instance" "web" {
  ami           = var.aws_ami
  instance_type = var.aws_instanceType

  tags = {
    Name = var.aws_instance_name
  }
}