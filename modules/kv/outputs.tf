output "kv-name" {
  description = "The kv long name"
  value       = "${var.project}-${var.env}-${var.instance}-kv"
}