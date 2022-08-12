



########### MODULE VARIABLES

variable "MD_LOCATION" {
  description = "Region where deploy disk"
  type        = string
  default     = ""
}

variable "MD_RG_NAME" {
  description = "Resource Group where deploy disk"
  type        = string
  default     = ""
}

variable "MD_VM_ENV" {
  description = "Enviroment of the resource"
  type        = string
  default     = ""
}

variable "MD_SUBNET_ID" {}
variable "MD_ALL_TAGS" {}
variable "MD_DNS_privatelink_mysql" {}

###########NAMING CONVENTION PREFIX

variable "MD_PROJECT_NAME" {
  description = "Project Name Prefix"
  type        = string
  default     = ""
}

variable "MD_SUBSCRIPTION_PREFIX" {
  description = "Subscription Prefix"
  type        = string
  default     = ""
}

variable "MD_REGION_PREFIX" {
  description = "Region Prefix"
  type        = string
  default     = ""
}

variable "MD_MYSQL_PREFIX" {
  description = "SQL MANAGED INSTANCE Prefix"
  type        = string
  default     = ""
}



variable "MD_PE_NAME" {
  description = "Private Endpoint Name"
  type        = string
  default     = ""

}

variable "MD_PESC_NAME" {
  description = "Private Endpoint Service Connection Name"
  type        = string
  default     = ""

}

###########MYSQL


variable "MD_MYSQL_ADMIN" {}
variable "MD_MYSQL_PWD" {}
variable "MD_MYSQL_SKU" {}
variable "MD_MYSQL_DISK_SIZE" {}
variable "MD_MYSQL_VERSION" {}



