output "dependency" {
  value = time_sleep.wait_in_seconds.triggers["dependency"]
}
