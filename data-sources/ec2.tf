resource "aws_instance" "web" {
  
  ami           = data.aws_ami.centos8.id # devops-practice
  instance_type =  "t2.micro"#local.instance_type
  tags={
   Name= "data-sources"#"locals"
  }
}