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

output "multi" {
  value = <<EOT
His palms are sweaty, knees weak, arms are heavy
There's vomit on his sweater already, mom's spaghetti
He's nervous, but on the surface he looks calm and ready
To drops bombs, but he keeps on forgetting
What he wrote down, the whole crowd goes so loud
He opens his mouth but the words won't come out
He's chokin, how? Everybody's jokin now
The clock's run out, time's up, over – blaow!
Snap back to reality, ohh – there goes gravity
EOT
}
