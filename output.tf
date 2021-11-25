output "alarm_name" {
  value       = var.alarm_name
  description = "Name of alarm created"
}

output "alarm_arn" {
  value       = var.alarm_type == "system" ? join(",", aws_cloudwatch_metric_alarm.system.*.arn) : join(",", aws_cloudwatch_metric_alarm.instance.*.arn)
  description = "ARN of alarm created"
}
