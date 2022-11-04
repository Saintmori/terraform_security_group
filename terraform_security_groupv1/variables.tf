variable "env" {
  type    = string
  default = "dev"
}
variable "ingress_rules" {
  type = map(any)
  default = {
    22  = "0.0.0.0/0"
    80  = "0.0.0.0/0"
    443 = "0.0.0.0/0"
  }
}