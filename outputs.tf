output "lb_arn" {
  description = "ARN of LB created by ingress controller"
  value       = data.aws_lb.lb.arn
}

output "lb_dns_name" {
  description = "DNS name of LB created by ingress controller"
  value       = data.aws_lb.lb.dns_name
}
