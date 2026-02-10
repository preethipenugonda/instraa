variable "ami_id" {
  default = "ami-0b6c6ebed2801a5cb"
}
variable "instance_type" {
  default = "t2.medium"
}
variable "key_docker" {
  description = "Existing EC2 Key Pair name"
  type        = string
  default     = "preethi"
}