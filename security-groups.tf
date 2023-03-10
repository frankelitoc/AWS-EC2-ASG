resource "aws_default_vpc" "defaulty_vpc" {

}

resource "aws_security_group" "webservergroup" {
  name   = "Allow HTTP/SSH"
  vpc_id = aws_default_vpc.defaulty_vpc.id

  ingress {
    description = "HTTP Access only"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}