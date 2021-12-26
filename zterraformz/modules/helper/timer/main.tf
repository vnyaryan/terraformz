resource "time_sleep" "wait_in_seconds" {
  triggers = {
    dependency = var.dependency
  }
  create_duration = "${var.wait_in_seconds}s"
}
