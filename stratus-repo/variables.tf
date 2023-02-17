
variable "source_template" {
  type = string
}
variable "name" {
  type = string
}
variable "description" {
  type = string
  default = ""
}

variable "developers" {
  type = list(string)
}

variable "allow_merge_commit" {
  default = false
}