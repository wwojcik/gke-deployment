Run
```shell
gcloud auth application-default login
terraform init
terraform plan  -var-file=google.tfvars.json -out=dev.tfplan
terraform apply dev.tfplan
```

Example google.tfvars.json file
```json
{
  "gcp_project_id": "troussauio",
  "region": "us-central1",
  "ssh_pub_key": "~/.ssh/id_rsa.pub",
  "inventory_file": "../../ansible/inventory/dev.ini",

  "keyfile_location": "~/credentials.json",

  "prefix": "development",

  "ssh_whitelist": [
    "0.0.0.0/0"
  ],
  "api_server_whitelist": [
    "0.0.0.0/0"
  ],
  "nodeport_whitelist": [
    "0.0.0.0/0"
  ],

  "machines": {
    "master-0": {
      "node_type": "master",
      "size": "n1-standard-2",
      "zone": "us-central1-a",
      "additional_disks": {},
      "scheduling": {
        "preemptible": false,
        "automatic_restart": true
      },
      "boot_disk": {
        "image_name": "ubuntu-os-cloud/ubuntu-2004-focal-v20210927",
        "size": 50
      }
    },
    "worker-0": {
      "node_type": "worker",
      "size": "n1-standard-2",
      "zone": "us-central1-a",
      "scheduling": {
        "preemptible": true,
        "automatic_restart": false
      },
      "additional_disks": {
        "extra-disk-1": {
          "size": 100
        }
      },
      "boot_disk": {
        "image_name": "ubuntu-os-cloud/ubuntu-2004-focal-v20210927",
        "size": 50
      }
    }
  }
}
```
