output "hello_urls" {
  type        = list(string)
  description = "URLs to invoke functions"
  value       = [for x in component.function : x.invoke_url]
}

output "hello_function_urls" {
  type        = list(string)
  description = "URLs to invoke functions (audience format)"
  value       = [for x in component.function : x.function_url]
}
