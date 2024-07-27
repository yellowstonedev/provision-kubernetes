terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "2.25.0"
    }
  }
}
//Use the Linode Provider
provider "linode" {
  token = var.token
}

//Use the linode_lke_cluster resource to create
//a Kubernetes cluster
resource "linode_lke_cluster" "green" {
    k8s_version = var.k8s_version
    label = var.label
    region = var.region
    tags = var.tags

    dynamic "pool" {
        for_each = var.pools
        content {
            type  = pool.value["type"]
            count = pool.value["count"]
        }
    }
}

//Export this cluster's attributes
output "kubeconfig" {
   value = linode_lke_cluster.green.kubeconfig
   sensitive = true
}

output "api_endpoints" {
   value = linode_lke_cluster.green.api_endpoints
}

output "status" {
   value = linode_lke_cluster.green.status
}

output "id" {
   value = linode_lke_cluster.green.id
}

output "pool" {
   value = linode_lke_cluster.green.pool
}
    