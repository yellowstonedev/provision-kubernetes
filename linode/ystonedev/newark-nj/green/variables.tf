variable "token" {
    description = "Linode API Key (required)"
}

variable "k8s_version" {
  description = "The Kubernetes version to use for this cluster. (required)"
  default = "1.29"
}

variable "label" {
  description = "The unique label to assign to this cluster. (required)"
  default = "default-lke-cluster"
}

variable "region" {
  description = "The region where your cluster will be located. (required)"
  default = "us-east"
}

variable "tags" {
  description = "Tags to apply to your cluster for organizational purposes. (optional)"
  type = list(string)
  default = ["test"]
}

variable "pools" {
  description = "The Node Pool specifications for the Kubernetes cluster. (required)"
  type = list(object({
    type = string
    count = number
  }))
  default = [
    {
      type = "g6-nanode-1"
      count = 3
    }
  ]
}
