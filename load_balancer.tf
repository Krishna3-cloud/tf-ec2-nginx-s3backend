resource "aws_elb" "EC2Terraform" {
  name = "Load-Balancer"

  subnets         = ["${aws_subnet.Subnet_1.id}", "${aws_subnet.Subnet_2.id}"]
  security_groups = ["${aws_security_group.elb.id}"]
  instances       = ["${aws_instance.EC2Terraform.id}", "${aws_instance.EC2Terraform_1.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
resource "aws_lb_target_group" "Target_Group" {
  name     = "TargetGroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.First_VPC.id
}
resource "aws_lb_target_group_attachment" "TG_attach" {
  target_group_arn = aws_lb_target_group.Target_Group.arn
  target_id        = aws_instance.EC2Terraform.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "TG_attach_1" {
  target_group_arn = aws_lb_target_group.Target_Group.arn
  target_id        = aws_instance.EC2Terraform_1.id
  port             = 80
}
