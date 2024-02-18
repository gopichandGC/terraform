resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"
  vpc_security_group_ids=[aws_security_group.allow_tls.id] # This means list

  tags = {
    Name = "Hello-Terraform"
  }
}

resource "aws_security_group" "allow_tls" { # This is terraform name, for terraform reference only.
  name        = var.sg-name   # This is for aws
  description = var.sg-description
  #vpc_id      = aws_vpc.main.id
 
  ingress {
    description = "TLS from  VPC"
    from_port        = var.inbound-from-port # 0 means all ports
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
    #ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
