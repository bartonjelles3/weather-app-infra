variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
  default     = "us-west1"
}

variable "terraform_service_account" {
  description = "service account to use for changes"
}