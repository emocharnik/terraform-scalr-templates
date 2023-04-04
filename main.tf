variable "input" {
  type = list(string)
}

resource "random_shuffle" "test" {
  input = var.input
  result_count = 1
  keepers = {
    "input": var.input
  }
}

output "choice" {
  value = random_shuffle.test.result
}