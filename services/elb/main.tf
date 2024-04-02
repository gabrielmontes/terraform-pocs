resource "aws_elb" "poc" {
  name               = var.name
  availability_zones = ["${var.az}"]
  security_groups    = ["${var.security_group}"]

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = var.port
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:${var.port}/"
  }
}