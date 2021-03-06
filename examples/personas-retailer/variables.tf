variable "prefix" {
  type        = string
  default     = "tfe"
  description = "This prefix is used in the subdomain and friendly_name generation."
}

variable "tfe_subdomain" {
  type        = string
  default     = null
  description = <<DOC
    Subdomain for accessing the Terraform Enterprise UI. If this value is null,
    a random_pet-based name will be generated and used.
DOC
}

variable "domain_name" {
  type        = string
  description = "Domain for creating the Terraform Enterprise subdomain on."
}

variable "license_path" {
  type        = string
  description = "File path to Replicated license file"
}

variable "acm_certificate_arn" {
  type        = string
  description = "The ARN of an existing ACM certificate."
}

variable "common_tags" {
  type        = map(string)
  description = "(Optional) Map of common tags for all taggable AWS resources."
  default     = {}
}

# Proxy defaults
# Squid uses about 10 and 25 GB of disk space for each Mbps of web traffic
# Squid also leverages about 32MB of memory for each 1GB of disk space since
# an m4.large has 4GB of memory, the instance is sized with 256 GiB. This would
# cache approximately 36 Mbps of web traffic for approximately 7 days.
variable "squid_instance_type" {
  type        = string
  default     = "m4.large"
  description = "Instance type for Squid proxy"
}

variable "squid_volume_size" {
  type        = string
  default     = "256"
  description = "Volume size in GiB for Squid proxy"
}

variable "key_name" {
  description = "The name of the key pair to be used for SSH access to the EC2 instance(s)."
  type        = string
}
