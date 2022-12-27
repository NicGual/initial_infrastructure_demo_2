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

variable "TOOLS_PORTS" {
  type        = list(map(string))
  default = [
    {
      description = "Allow SSH traffic"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "Jenkins Port"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "Sonarqube Port"
      from_port   = 9000
      to_port     = 9000
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "Prometheus Port"
      from_port   = 9090
      to_port     = 9090
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "Grafana Port"
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "Node Exporter Port"
      from_port   = 9100
      to_port     = 9100
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}