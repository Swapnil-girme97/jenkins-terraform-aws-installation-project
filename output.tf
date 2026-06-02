output "jenkins_public_ip" {
    value = aws_instance.jenkins_instance_ec2.public_ip
}