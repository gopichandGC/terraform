resource "aws_security_group" "roboshop-all" { # This is terraform name, for terraform reference only.
  name        = "dynamic-demo"   # This is for aws
  description = "dynamic-demo"
  #vpc_id      = aws_vpc.main.id
 
  dynamic ingress {
    for_each = var.ingress_rules
    content {
        description      =   ingress.value["description"]
        from_port        = ingress.value["from_port"]#var.inbound-from-port # 0 means all ports
        to_port          = ingress.value["to_port"]
        protocol         = ingress.value["protocol"]
        cidr_blocks      = ingress.value["cidr_blocks"]
    #var.cidr_blocks
    #ipv6_cidr_blocks = ["::/0"]
    }
  }

#   ingress {
#     description = "Allow port 443"
#     from_port        = 443#var.inbound-from-port # 0 means all ports
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]#var.cidr_blocks
#     #ipv6_cidr_blocks = ["::/0"]
#   }

#   ingress {
#     description = "Allow port 22"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     #ipv6_cidr_blocks = ["::/0"]
#   }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-all"
  }
}
