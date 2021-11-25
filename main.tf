data "aws_region" "current" {}

locals {
  alarm_actions = length(var.alarm_actions) == 0 ? ["arn:aws:automate:${data.aws_region.current.name}:ec2:${var.alarm_type == "system" ? "recover" : "reboot"}"] : var.alarm_actions
}

resource "aws_cloudwatch_metric_alarm" "system" {
  count               = var.alarm_type == "system" ? 1 : 0
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "StatusCheckFailed_System"
  namespace           = "AWS/EC2"

  dimensions = {
    "InstanceId" = var.instance_id
  }

  period                    = var.period
  statistic                 = "Average"
  threshold                 = "0.99"
  alarm_description         = var.description
  alarm_actions             = local.alarm_actions
  insufficient_data_actions = var.insufficient_data_actions
  tags                      = var.tags
}

resource "aws_cloudwatch_metric_alarm" "instance" {
  count               = var.alarm_type == "instance" ? 1 : 0
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "StatusCheckFailed_Instance"
  namespace           = "AWS/EC2"

  dimensions = {
    "InstanceId" = var.instance_id
  }

  period                    = var.period
  statistic                 = "Average"
  threshold                 = "0.99"
  alarm_description         = var.description
  alarm_actions             = local.alarm_actions
  insufficient_data_actions = var.insufficient_data_actions
  tags                      = var.tags
}
