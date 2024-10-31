# Create a random string so this run can be unique and not conflict with other runs
resource "random_string" "random" {
  length      = 4
  min_numeric = 1
  special     = false
  upper       = false
}