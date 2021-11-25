variable "alarm_type" {
  type        = string
  default     = "system"
  description = "Type of EC2 health alarm to create. **Possible Values:** system or instance"
}

variable "alarm_name" {
  type        = string
  description = "Name of cloudwatch alarm"
}

variable "instance_id" {
  type        = string
  description = "ID of EC2 instance which needs to be monitored"
}

variable "period" {
  type        = string
  default     = "60"
  description = "The period in seconds over which the result is based on"
}

variable "description" {
  type        = string
  default     = "This alarms monitors ec2 instance system health check"
  description = "The description for the alarm"
}

variable "alarm_actions" {
  type        = list(string)
  default     = []
  description = "List of ARNs pointing to specific actions that should be invoked when a threshold is breached. Refer [PutMetricAlarm](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_PutMetricAlarm.html) API for action ARN. **Note:** Default action will be set to recover for system health check alarm and reboot for instance health check alarm"
}

variable "insufficient_data_actions" {
  type        = list(string)
  default     = []
  description = "List of ARNs pointing to specific actions that should be invoked when an alarm is in `Insufficient Data` status"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Map of key-value pair to associate with alarm"
}
