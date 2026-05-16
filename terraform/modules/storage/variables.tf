variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnet" {
  description = "A list of private subnet IDs"
  type        = list(string)
}

variable "ec2_sg" {
  description = "The security group ID of the EC2 instances"
  type        = string
}
