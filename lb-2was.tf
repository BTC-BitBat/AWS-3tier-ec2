#NLB 생성
resource "aws_lb" "tier-nlb-was" {
  name               = "tier-nlb-was"
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.web-sub-a.id, aws_subnet.web-sub-c.id] #Web Subnet에서 Was를 바라봄

  tags = {
    "Name" = "tier-nlb-was"
  }
}

#Target Group
# Was 의 Tomcat은 8080 Port로 통신
resource "aws_lb_target_group" "tier-n-target-was" {
  name        = "tier-n-target-was"
  port        = 8080
  protocol    = "TCP"
  vpc_id      = aws_vpc.tier.id
  target_type = "instance"

  tags = {
    "Name" = "tier-n-target-was"
  }
}

resource "aws_lb_listener" "tier-n-listner-was" {
  load_balancer_arn = aws_lb.tier-nlb-was.arn
  port              = "8080"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tier-n-target-was.arn
  }
}
#NLB Attachement 생성
resource "aws_lb_target_group_attachment" "tier-n-attache-was1" {
  target_group_arn = aws_lb_target_group.tier-n-target-was.arn
  target_id        = aws_instance.tier-ec2-pri-a-was1.id
  port             = 8080
}
resource "aws_lb_target_group_attachment" "tier-n-attache-was2" {
  target_group_arn = aws_lb_target_group.tier-n-target-was.arn
  target_id        = aws_instance.tier-ec2-pri-c-was2.id
  port             = 8080
}
