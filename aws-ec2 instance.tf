
resource "aws_instance" "roboshop" {
  count         = 10
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.common[0].id,
    aws_security_group.roboshop[count.index].id
  ]

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
}

resource "aws_security_group" "common" {
  count       = 1
  name        = "${var.project}-${var.environment}-common"
  description = "a common security group for all the instances of roboshop"

   ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }
   tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
}

resource "aws_security_group" "roboshop" {
  count       = 10
  name        = "${var.project}-${var.environment}-${var.instances[count.index]}"
  description = "individual security for all the instances of roboshop"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
   tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
}
