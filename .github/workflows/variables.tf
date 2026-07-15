variable "databases" {
  type        = map(string)
  description = "Map of database names to create"
  default     = {}
}

# This tells Terraform: "It's okay to accept 'table_name' from the command line"
variable "table_name" {
  type        = string
  description = "The name of the table"
}
