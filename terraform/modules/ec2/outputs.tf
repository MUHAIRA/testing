output "ec2_instance_ids" {
  description = "The EC2 instance IDs"
  value       = aws_instance.ec2_instance[*].id
}
