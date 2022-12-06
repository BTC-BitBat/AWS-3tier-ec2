#외부ALB 생성(External)
resource "aws_lb" "tier-alb-web" {
  name               = "tier-alb-web"
  internal           = false #외부 로드밸런서(External)
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tier-sg-alb-web.id]          #alb는 sg가 필요합니다.
  subnets            = [aws_subnet.public-a.id, aws_subnet.public-c.id] # public에서 web 통신

  tags = {
    "Name" = "tier-alb-web"
  }
}
#TargetGroup 생성
resource "aws_lb_target_group" "tier-a-target-web" {
  name        = "tier-target-wb"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.tier.id
  target_type = "instance"

  tags = {
    "Name" = "tier-target-web"
  }

}
#Listener 생성
resource "aws_lb_listener" "tier-a-listener-web" {
  load_balancer_arn = aws_lb.tier-alb-web.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tier-a-target-web.arn
  }

}

#2개의 Web Attachment
resource "aws_lb_target_group_attachment" "tier-a-attach-web1" {
  target_group_arn = aws_lb_target_group.tier-a-target-web.arn
  target_id        = aws_instance.tier-ec2-pri-a-web1.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "tier-a-attach-web2" {
  target_group_arn = aws_lb_target_group.tier-a-target-web.arn
  target_id        = aws_instance.tier-ec2-pri-web2.id
  port             = 80
}
