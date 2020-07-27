variable "environment" {
  type            = string
  description     = "The deployment environment state (eg. production, develop)"
  default         = "develop"
}

variable "name" {
  type            = string
  description     = "HAProxy Terraform Project Name."
  default         = "haproxy"
}

variable "values_file" {
  type            = string
  description     = "Values File"
  default         = "values.yml"
  validation {
    condition     = length(regexall(".yml", var.values_file)) > 0 || length(regexall(".yaml", var.values_file)) > 0
    error_message = "The values_file value must be a valid YML file."
  }
}

variable "key_name" {
  type            = string
  description     = "SSH key name"
  default         = null
}
