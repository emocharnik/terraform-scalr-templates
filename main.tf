variable "input" {
  type = list(string)
}

resource "random_shuffle" "test" {
  input = var.input
}

output "choice" {
  value = random_shuffle.test.result
}