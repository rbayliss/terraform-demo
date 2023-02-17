

provider "github" {
  # Enter a token here, or set the GITHUB_TOKEN environment variable.
  # Enter an organization here, or set the GITHUB_OWNER environment variable.
  # token = ""
  # owner = ""
}

terraform {
  
  required_providers {
    github = {
        version = "~> 5.17.0"
        source = "hashicorp/github"
    }
  }
}