data "aws_ami" "amznlinux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.*-x86_64-gp2"]
  }
}

data "aws_availability_zones" "all" {
  state = "available"
}

module "sg" {
  source = "./services/sg"
  name = "poc-ec2"
  to_port = 80
  from_port = 80
  protocol = "tcp"
}

module "elb" {
  source = "./services/elb"
  name = "poc-elb"
  security_group = module.sg.security_group_id
  az = data.aws_availability_zones.all.names[0]
  port = 80
}

module "asg" {
  source = "./services/asg"
  name = "poc-asg"
  ami = data.aws_ami.amznlinux.id
  user_data = ""
  security_group = module.sg.security_group_id
  lb = module.elb.elb_dns_name
  az = data.aws_availability_zones.all.names[0]
}

