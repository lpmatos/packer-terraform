output "instance_id" {
  value       = aws_instance.haproxy.id
  description = "The instance ID."
}

output "instance_arn" {
  value       = aws_instance.haproxy.arn
  description = "The ARN of the instance."
}
