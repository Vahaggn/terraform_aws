variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "the region which want to config"
}
variable "aws_ami" {
  default     = "ami-090fa75af13c156b4"
  type        = string
  description = "the ami which want to config"
}
variable "aws_instanceType" {
  default     = "t2.micro"
  type        = string
  description = "the instanceType which want to config"
}
variable "aws_instance_name" {
  default     = "testbyvahag"
  type        = string
  description = "the instanceType which want to config"
}