data "graphql_query" "repositories" {
  query_variables = {}
  query           = file("${path.module}/graphql/get-repositories.graphql")
}
