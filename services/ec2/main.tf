resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  user_data = file("${var.user_data}")
  iam_instance_profile = aws_iam_instance_profile.poc-ec2-ssm-profile.name 

  root_block_device {
    delete_on_termination = true
    volume_type           = "gp2"
    volume_size           = 20
  }

  tags = {
    "Name" = var.name
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