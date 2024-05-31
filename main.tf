################################
# Get the HCP org and admin team
################################

# Get the current HCP organization
data "hcp_organization" "org" {
}

# Get the admin HCP group
data "hcp_group" "admin_group" {
  resource_name = var.admin_group
}

###########################################################
# Create the HCP project and grant the current HCP group 
# the admin role in the project
#
# This is only required if your token for the TFE provider
# is a team token. Without this, the token authenticated
# to run this configuration cannot access the new project 
# in HCP Terraform
###########################################################

# Create a new project
resource "hcp_project" "team_project" {
  name = var.project_name
}

# Add ourselves as an admin to the new project
resource "hcp_project_iam_binding" "group_project_admin" {
  principal_id = data.hcp_group.admin_group.resource_id
  project_id   = hcp_project.team_project.resource_id
  role         = "roles/admin" # only admins can manage project role assignment
}

######################################
# Create a group and assign it to the 
# project in TFE
######################################

# Create the group
resource "hcp_group" "poject_group" {
  display_name = var.group_name
  description  = "${var.group_name} group"
}


# Get the HCP group from the TFE side
data "tfe_team" "project_team" {
  name         = hcp_group.poject_group.display_name
  organization = data.hcp_organization.org.name
}

# Get the corresponding project ID in HCP Terraform
data "tfe_project" "project" {
  name         = hcp_project.team_project.name
  organization = data.hcp_organization.org.name
  depends_on   = [hcp_project_iam_binding.group_project_admin]
}

# Add the group to the project
resource "tfe_team_project_access" "admin" {
  access     = "maintain"
  team_id    = data.tfe_team.project_team.id
  project_id = data.tfe_project.project.id
}

###################################
# Manage resources in HCP Terraform
###################################

# Cloud provider credential variable set
resource "tfe_variable_set" "cloud_auth" {
  name         = "${var.project_name} cloud credentials"
  description  = "Authenticate ${var.project_name} for provisioning infrastructure"
  organization = data.hcp_organization.org.name
}

# Bind the variable set to the project
resource "tfe_project_variable_set" "cloud_auth" {
  project_id      = data.tfe_project.project.id
  variable_set_id = tfe_variable_set.cloud_auth.id
}

# Set up fake cloud credentials
resource "tfe_variable" "aws_key_id" {
  key             = "AWS_ACCESS_KEY_ID"
  value           = var.aws_key_id
  category        = "env"
  description     = "AWS key ID"
  variable_set_id = tfe_variable_set.cloud_auth.id
}

resource "tfe_variable" "aws_secret" {
  key             = "AWS_SECRET_ACCESS_KEY"
  value           = var.aws_secret
  category        = "env"
  sensitive       = true
  description     = "AWS secret key"
  variable_set_id = tfe_variable_set.cloud_auth.id
}