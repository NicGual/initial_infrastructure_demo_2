variable "AWS_REGION" {
  default = "us-east-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "AMIS" {
  type = map(string)
  default = {
    us-east-1    = "ami-01d08089481510ba2"
    ca-central-1 = "ami-0ab6f6340b2a4fb77"
  }
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}