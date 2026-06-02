resource "aws_instance" "jenkins_instance_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.jenkins_public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]   

  user_data= file("scripts/jenkins.sh")
  tags = {
    Name = "jenkins_instance_ec2"
  }
  
}