# HCP Terraform Provider Example

This repository is an example how use to use the HCP and TFE Terraform providers to manage HCP Terraform.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | 0.90.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.55.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcp_group.poject_group](https://registry.terraform.io/providers/hashicorp/hcp/0.90.0/docs/resources/group) | resource |
| [hcp_project.team_project](https://registry.terraform.io/providers/hashicorp/hcp/0.90.0/docs/resources/project) | resource |
| [hcp_project_iam_binding.group_project_admin](https://registry.terraform.io/providers/hashicorp/hcp/0.90.0/docs/resources/project_iam_binding) | resource |
| [tfe_project_variable_set.cloud_auth](https://registry.terraform.io/providers/hashicorp/tfe/0.55.0/docs/resources/project_variable_set) | resource |
| [tfe_team_project_access.admin](https://registry.terraform.io/providers/hashicorp/tfe/0.55.0/docs/resources/team_project_access) | resource |
| [tfe_variable.aws_key_id](https://registry.terraform.io/providers/hashicorp/tfe/0.55.0/docs/resources/variable) | resource |
| [tfe_variable.aws_secret](https://registry.terraform.io/providers/hashicorp/tfe/0.55.0/docs/resources/variable) | resource |
| [tfe_variable_set.cloud_auth](https://registry.terraform.io/providers/hashicorp/tfe/0.55.0/docs/resources/variable_set) | resource |
| [hcp_group.admin_group](https://registry.terraform.io/providers/hashicorp/hcp/0.90.0/docs/data-sources/group) | data source |
| [hcp_organization.org](https://registry.terraform.io/providers/hashicorp/hcp/0.90.0/docs/data-sources/organization) | data source |
| [tfe_project.project](https://registry.terraform.io/providers/hashicorp/tfe/0.55.0/docs/data-sources/project) | data source |
| [tfe_team.project_team](https://registry.terraform.io/providers/hashicorp/tfe/0.55.0/docs/data-sources/team) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_group"></a> [admin\_group](#input\_admin\_group) | The name of the the group creating the project | `string` | n/a | yes |
| <a name="input_aws_key_id"></a> [aws\_key\_id](#input\_aws\_key\_id) | AWS Key ID | `string` | `"fake key"` | no |
| <a name="input_aws_secret"></a> [aws\_secret](#input\_aws\_secret) | AWS Secret Access Key | `string` | `"fake secret"` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | The name of the project group to create | `string` | `"provider-example-group"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project to create | `string` | `"provider-example"` | no |

## Outputs

No outputs.
