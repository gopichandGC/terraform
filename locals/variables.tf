variable "instance_names"{
    type=list
    default=["mongodb","catalogue","redis","user","cart","mysql","shipping","rabbitmq","payment","dispatch","web"]    
}

variable "ami_id" {
    type=string
    default="ami-0f3c7d07486cad139"
}

variable "zone_id"{
default="Z01392352BS5MX7GMAHS1"
}

variable "domain_name" {
    default="techwithgopi.online"
}