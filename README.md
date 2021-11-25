# Create health check alarm for EC2

![License](https://img.shields.io/github/license/terrablocks/aws-ec2-health-check?style=for-the-badge) ![Tests](https://img.shields.io/github/workflow/status/terrablocks/aws-ec2-health-check/tests/master?label=Test&style=for-the-badge) ![Checkov](https://img.shields.io/github/workflow/status/terrablocks/aws-ec2-health-check/checkov/master?label=Checkov&style=for-the-badge) ![Commit](https://img.shields.io/github/last-commit/terrablocks/aws-ec2-health-check?style=for-the-badge) ![Release](https://img.shields.io/github/v/release/terrablocks/aws-ec2-health-check?style=for-the-badge)

This terraform module will deploy the following services:
- CloudWatch Alarm

# Usage Instructions
## Example
```terraform
module "ec2_system_health_check" {
  source = "github.com/terrablocks/aws-ec2-health-check.git"

  alarm_name  = "web-server-system-health-check"
  instance_id = "i-xxxxxxxx"
}

module "ec2_instance_health_check" {
  source = "github.com/terrablocks/aws-ec2-health-check.git"

  alarm_type  = "instance"
  alarm_name  = "web-server-instance-health-check"
  instance_id = "i-xxxxxxxx"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.37.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm_type | Type of EC2 health alarm to create. **Possible Values:** system or instance | `string` | `"system"` | no |
| alarm_name | Name of cloudwatch alarm | `string` | n/a | yes |
| instance_id | ID of EC2 instance which needs to be monitored | `string` | n/a | yes |
| period | The period in seconds over which the result is based on | `string` | `"60"` | no |
| description | The description for the alarm | `string` | `"This alarms monitors ec2 instance system health check"` | no |
| alarm_actions | List of ARNs pointing to specific actions that should be invoked when a threshold is breached. Refer [PutMetricAlarm](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_PutMetricAlarm.html) API for action ARN. **Note:** Default action will be set to recover for system health check alarm and reboot for instance health check alarm | `list(string)` | `[]` | no |
| insufficient_data_actions | List of ARNs pointing to specific actions that should be invoked when an alarm is in `Insufficient Data` status | `list(string)` | `[]` | no |
| tags | Map of key-value pair to associate with alarm | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| alarm_name | Name of alarm created |
| alarm_arn | ARN of alarm created |
