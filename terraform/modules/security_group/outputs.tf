output "security_group_id" {
  description = "The security group ID"
  value       = aws_security_group.ec2_security_group.id
}
