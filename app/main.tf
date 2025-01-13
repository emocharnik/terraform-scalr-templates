variable "input" {
  type = list(string)
}

resource "random_shuffle" "test" {
  input = var.input
  result_count = 1
  keepers = {
    "input": join(",", var.input)
  }
}

output "choice" {
  value = random_shuffle.test.result
}

output "complex" {
  value = {
    "string": "string_value",
    "bool": true,
    "list": var.input,
    "map": {"k1": "v2"},
    "map_of_lists": [
      {
        "k3": "v4"
      },
      {
        "k5": "v6"
      }
    ]
  }
}
