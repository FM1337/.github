output "repositories" {
  description = "repositories matching filter"
  value       = local.repositories
}

output "user" {
  description = "authenticated user information"
  value       = local.github_user
}
