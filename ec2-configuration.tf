
resource "aws_launch_configuration" "EC2_Webserver" {
  name_prefix     = "httpd_launch"
  image_id        = "ami-0aa7d40eeae50c9a9"
  security_groups = [aws_security_group.webservergroup.id]
  instance_type   = "t2.micro"
  user_data       = <<-EOF
  #!/bin/bash
  echo "*** Installing nginx"
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<center><h1> Hi! from $(hostname -i)</h1></center>" > /var/www/html/index.html
  echo "*** Completed Installing nginx"
  EOF

  lifecycle {
    create_before_destroy = true
  }
}