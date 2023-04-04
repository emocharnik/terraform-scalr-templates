variable "input" {
  type = list(string)
}

resource "random_shuffle" "test" {
  input = var.input
}