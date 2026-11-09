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
    type = map
    default = {
        mogodb = {
            instance_type = "t3.micro"
            port_no = "27017"
        }
        redis = {
            instance_type = "t3.micro"
            port_no = "6379"
        }
        mysql = {
            instance_type = "t3.micro"
            port_no = "3306"
        }
        rabbitmq = {
            instance_type = "t3.micro"
            port_no = "5672"
        }
        catalogue = {
            instance_type = "t3.micro"
            port_no = "8080"
        }
        user = {
            instance_type = "t3.micro"
            port_no = "8080"
        }
        cart = {
            instance_type = "t3.micro"
            port_no = "8080"
        }
        shipping = {
            instance_type = "t3.micro"
            port_no = "8080"
        }
        payment = {
            instance_type = "t3.micro"
            port_no = "8080"
        }
        frontend = {
            instance_type = "t3.micro"
            port_no = "80"
        }
        

        


 }
}

variable "zone_id"{
    default = "Z02795771TLDB7CKVSHO4"
}
variable "domain_name"{
    default = "daws92s.shop"
}