resource "aws_security_group" "Security_TF" {
  name        = "Security_TF"
  description = "security group for instances"
  vpc_id      = aws_vpc.First_VPC.id

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "Inbound Rules"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-ec2"
  }
}

#--->for elastic load balancer security froup


resource "aws_security_group" "elb" {
  name        = "Security_ELB"
  description = "security group for loadbalancer"
  vpc_id      = aws_vpc.First_VPC.id

  ingress {
    from_port   = 80
    to_port     = 80
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
