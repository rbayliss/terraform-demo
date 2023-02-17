
// Create a team.
resource "github_team" "this" {
  name = "my-awesome-team"
}

// Create the repository.
module "my-awesome-repo" {
  source = "./stratus-repo"
  name = "my-awesome-repo"
  description = "This repository is awesome"
  source_template = "my-template"
  allow_merge_commit = true
  // Associate the team with the repository.
  developers = [
    github_team.this.id
  ]
}
