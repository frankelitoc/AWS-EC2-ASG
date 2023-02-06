variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "az_zones" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}