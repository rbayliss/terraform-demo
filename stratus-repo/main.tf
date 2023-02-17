
data "github_repository" "template" {
  name = var.source_template
}

resource "github_repository" "this" {
  name        = var.name
  description = var.description

  visibility = "private"
  template {
    owner = split("/", data.github_repository.template.full_name)[0]
    repository           = data.github_repository.template.name
  }
  vulnerability_alerts = true
  ignore_vulnerability_alerts_during_read = true
  allow_merge_commit = var.allow_merge_commit
  allow_squash_merge = true
  // @todo: Doesn't yet support automated updates - see https://github.com/integrations/terraform-provider-github/issues/1301
}

# Set the default branch to be the same as the template.
resource "github_branch_default" "this" {
    repository = github_repository.this.name
    branch = data.github_repository.template.default_branch
}

# Setup the branch protection rules.
# resource "github_branch_protection" "this" {
#   repository_id = github_repository.this.name

#   pattern          = data.github_repository.template.default_branch
#   enforce_admins   = true
#   require_signed_commits = true

#   required_status_checks {
#     strict   = true
#     // @todo: We need more complex logic than this. Should we attempt to derive
#     // from the template?
#     contexts = ["build_and_test"]
#   }
#   required_pull_request_reviews {
#     require_code_owner_reviews = true
#   }
# }

resource "github_team_repository" "developers" {
  count = length(var.developers)
  repository = github_repository.this.id
  team_id = var.developers[count.index]
}