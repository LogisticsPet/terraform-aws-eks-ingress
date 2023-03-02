output "lb_arn" {
  description = "ARN of LB created by ingress controller"
  value       = data.aws_lb.lb.arn
}
