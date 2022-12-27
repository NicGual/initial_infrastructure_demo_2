resource "aws_instance" "jenkins-master" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-jenkins.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",  
      "sudo /tmp/script.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

resource "aws_instance" "jenkins-agent" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-jenkins.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

}

resource "aws_instance" "sonarqube-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.medium"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-jenkins.id

  # the security group
  vpc_security_group_ids = [aws_security_group.sonarqube-sg.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
  

}

resource "aws_instance" "prometheus-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.medium"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-jenkins.id

  # the security group
  vpc_security_group_ids = [aws_security_group.prometheus-sg.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  user_data = data.template_cloudinit_config.prometheus_data.rendered

  tags = {
    "Name" = "Prometheus server"
  }

}

resource "aws_instance" "grafana-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-jenkins.id

  # the security group
  vpc_security_group_ids = [aws_security_group.public-tools-sg.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  user_data = data.template_cloudinit_config.grafana_data.rendered

  tags = {
    "Name" = "Grafana server"
  }

}

resource "aws_instance" "node-exporter-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-jenkins.id

  # the security group
  vpc_security_group_ids = [aws_security_group.public-tools-sg.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  user_data = data.template_cloudinit_config.node_data.rendered

  tags = {
    "Name" = "Node Exporter server"
  }

}
