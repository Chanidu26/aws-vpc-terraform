variable "public_subnet_id" {
    type = string
    description = "value of public subnet id"
}
variable "security_group_id" {
    type = list(string)
    description = "value of security group id"
}