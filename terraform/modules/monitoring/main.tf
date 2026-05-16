resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_cloudwatch_log_group" "main" {
  name = "starttech-log-group-${random_string.suffix.result}"
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2-role-${random_string.suffix.result}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cw_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "ecr_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "starttech-ec2-profile-${random_string.suffix.result}"
  role = aws_iam_role.ec2_role.name
}