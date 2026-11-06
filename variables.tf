variable "instance_type" {
    type = string
    description = "roboshop instance type"
    default = "t3.micro"
 
}
variable "ami_id" {
  type = string
  description = "roboshop ami id"
  default = "ami-0055977a6e828a4f4"
}
variable "environment"{
    default = "dev"
}
variable "project"{
    default = "roboshop"
}
variable "instances"{
    default = ["mondodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"]
}
variable "zone_id"{
    default = "Z02795771TLDB7CKVSHO4"
}
variable "domain_name"{
    default = "daws92s.shop"
}