variable "gcloud" {
  type = map(any)
  default = {
    "project"             = "elasticsearch-laboratory"
    "region"              = "europe-west4"
    "zone"                = "europe-west4-a"
    "service_account_key" = "keys/elasticsearch-laboratory-9c640c9da76c.json"
    "ssh-user"            = "lab"
    "ssh-key"             = "keys/lab.pub"
  }
}
