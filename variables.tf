variable "account_id" {default = 2398}
variable "countries" {
  type = list(string)
  default = []
}
variable "ips" {
  type = list(string)
  default = []
}