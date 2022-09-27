
# Terraform Google Cloud SQL Proxy Module

This module launch in your GCP project a VM compute instance using the [COS](https://cloud.google.com/container-optimized-os/docs) starting a [Cloud SQL Proxy](https://github.com/GoogleCloudPlatform/cloud-sql-proxy) container.

It will : 
- Create a service account with `cloudsql.instanceUser` and `cloudsql.client`
- Deploy a COS compute instance with the proxy started
- Add an inbound rule in your firewall on the 5432 port to allow you to connect to the proxy

## Usage


Take a loot at the [example](./examples/main.tf) folder.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gce_container_sqlproxy"></a> [gce\_container\_sqlproxy](#module\_gce\_container\_sqlproxy) | terraform-google-modules/container-vm/google | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.inbound](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_project_iam_member.cloudsql_instance_client_role_to_main_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cloudsql_instance_user_role_to_main_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_public_ip"></a> [allow\_public\_ip](#input\_allow\_public\_ip) | Generate an ephemeral public if true | `bool` | `false` | no |
| <a name="input_container_args"></a> [container\_args](#input\_container\_args) | Containers arguments. | `list(string)` | `[]` | no |
| <a name="input_container_command"></a> [container\_command](#input\_container\_command) | Container command to start | `list(string)` | <pre>[<br>  "/cloud_sql_proxy"<br>]</pre> | no |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Source container image. Example : eu.gcr.io/cloudsql-docker/gce-proxy:1.32.0 | `string` | n/a | yes |
| <a name="input_cos_image_family"></a> [cos\_image\_family](#input\_cos\_image\_family) | The COS image family to use (eg: stable, beta, or dev) | `string` | `"stable"` | no |
| <a name="input_firewall_network"></a> [firewall\_network](#input\_firewall\_network) | The name or self\_link of the network to attach this firewall to. | `string` | n/a | yes |
| <a name="input_firewall_source_ranges"></a> [firewall\_source\_ranges](#input\_firewall\_source\_ranges) | The firewall will apply only to traffic that has source IP address in these ranges | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Instance name | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project id | `string` | n/a | yes |
| <a name="input_vm_machine_type"></a> [vm\_machine\_type](#input\_vm\_machine\_type) | The machine type to create. | `string` | `"e2-micro"` | no |
| <a name="input_vm_network"></a> [vm\_network](#input\_vm\_network) | The name or self\_link of the network to attach this interface to. | `string` | `null` | no |
| <a name="input_vm_subnetwork"></a> [vm\_subnetwork](#input\_vm\_subnetwork) | The name or self\_link of the subnetwork to attach this interface to. | `string` | `null` | no |
| <a name="input_vm_zone"></a> [vm\_zone](#input\_vm\_zone) | The zone that the machine should be created in | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
