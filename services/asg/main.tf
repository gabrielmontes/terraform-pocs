resource "aws_launch_configuration" "poc" {
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = ["${var.security_group}"]
  user_data       = file("${var.user_data}")
  iam_instance_profile = aws_iam_instance_profile.poc-ec2-ssm-profile.name 

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "poc" {
  launch_configuration  = aws_launch_configuration.poc.id
  availability_zones    = ["${var.az}"]
  load_balancers = ["${var.lb}"]
  health_check_type = "ELB"

  min_size = var.min_size
  max_size = var.max_size

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
}

resource "aws_iam_role" "poc-ec2-ssm-role" {
  name        = "poc-ssm-role"
  description = "The role for the developer resources EC2"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": {
      "Effect": "Allow",
      "Principal": {"Service": "ec2.amazonaws.com"},
      "Action": "sts:AssumeRole"
    }
  }
  EOF

  tags = {
    Name = "poc-ec2-ssm"
  }
}

resource "aws_iam_instance_profile" "poc-ec2-ssm-profile" {
  name = "poc-ec2-ssm"
  role = aws_iam_role.poc-ec2-ssm-role.name
}

resource "aws_iam_role_policy_attachment" "dev-resources-ssm-policy" {
  role       = aws_iam_role.poc-ec2-ssm-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}