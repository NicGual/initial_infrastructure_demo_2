output instance_ip {
  value       = aws_instance.jenkins-master.public_ip
}

output sonarqube_instance_ip {
  value       = aws_instance.sonarqube-instance.public_ip
}
