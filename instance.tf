terraform {
  backend "s3" {
    bucket = "s3-backend-bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
  }
}

# Now here we are creating Ec2 instance for our Nginx

resource "aws_instance" "EC2Terraform" {
  ami                    = var.ami
  instance_type          = var.ins_type
  key_name               = "key1"
  vpc_security_group_ids = ["${aws_security_group.Security_TF.id}"]
  subnet_id              = aws_subnet.Subnet_1.id
  tags = {
    Name = "ec2-nginx-server1"
  }
  user_data = file("${path.module}/script.sh") 
}


resource "aws_instance" "EC2Terraform_1" {
  ami                    = var.ami
  instance_type          = var.ins_type
  key_name               = "key1"
  vpc_security_group_ids = ["${aws_security_group.Security_TF.id}"]
  subnet_id              = aws_subnet.Subnet_2.id
  tags = {
    Name = "ec2-nginx-server2"
  }
  user_data = file("${path.module}/script.sh")
}




output "address" {
  value = aws_elb.EC2Terraform.dns_name
}
