provider "aws" {
  region = var.aws_region
}

resource "aws_autoscaling_group" "autoscaling" {
  name                      = "terraform-autoscaling"
  launch_configuration      = aws_launch_configuration.EC2_Webserver.name
  desired_capacity          = 3
  min_size                  = 2
  max_size                  = 4
  health_check_grace_period = 300
  health_check_type         = "ELB"
  availability_zones        = var.az_zones
  load_balancers            = ["${aws_elb.load_balancer.id}"]

}
