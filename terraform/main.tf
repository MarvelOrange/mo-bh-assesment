# Create a random string so this run can be unique and not conflict with other runs
resource "random_string" "random" {
  length      = 5
  min_numeric = 1
  special     = false
  upper       = false
}