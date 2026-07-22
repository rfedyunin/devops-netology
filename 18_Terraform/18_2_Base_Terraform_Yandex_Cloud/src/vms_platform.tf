### VM web variables

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name of the web VM"
}
/*
variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores for web VM"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "Memory in GB for web VM"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
  description = "Core fraction for web VM (20, 50, 100)"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family for web VM"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID for web VM"
}
*/
### VM db variables

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name of the db VM"
}

/*
variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores for db VM"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "Memory in GB for db VM"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "Core fraction for db VM (20, 50, 100)"
}

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family for db VM"
}


variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID for db VM"
}
*/