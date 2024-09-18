// This module will create the EC2 instances with user data.

resource "aws_instance" "ec2_instance" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type
  user_data     = file("${path.module}/user_data.sh")

  tags = {
    Name        = "${var.environment}-ec2-instance-${count.index + 1}"
    Environment = var.environment
  }

  vpc_security_group_ids = [var.security_group_id]
}
