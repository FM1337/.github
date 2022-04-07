locals {
  repositories_raw = jsondecode(data.graphql_query.repositories.query_response).data

  github_user = {
    login       = local.repositories_raw.viewer.login
    name        = local.repositories_raw.viewer.name
    email       = local.repositories_raw.viewer.email
    avatar_url  = local.repositories_raw.viewer.avatarUrl
    website_url = local.repositories_raw.viewer.websiteUrl
  }

  repositories = [
    for repo in local.repositories_raw.viewer.repositories.nodes : {
      name               = repo.name
      name_with_owner    = repo.nameWithOwner
      owner              = repo.owner.login
      url                = repo.url
      default_branch     = repo.defaultBranchRef.name
      config_repo        = repo.isUserConfigurationRepository
      homepage_url       = repo.homepageUrl
      pushed_at          = repo.pushedAt
      created_at         = repo.createdAt
      languages          = repo.languages.nodes[*].name
      has_issues_enabled = repo.hasIssuesEnabled
    }
    if !repo.isArchived
    && !repo.isDisabled
    && !repo.isLocked
    && !repo.isMirror
    && alltrue([for key, value in var.filters : (
      try(contains(value, repo[key]), false)
      || try(repo[key] == value, false)
      || try(length(regexall(value, repo[key])) > 0, false)
    )])
  ]
}
