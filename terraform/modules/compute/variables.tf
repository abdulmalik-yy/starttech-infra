variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "ami" {
  description = "The AMI ID for the instances"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "public_subnet" {
  description = "A list of public subnet IDs"
  type        = list(string)
}

variable "private_subnet" {
  description = "A list of private subnet IDs"
  type        = list(string)
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile name to attach to EC2 instances"
  type        = string
}
