resource "keycloak_openid_client" "kubernetes" {
  realm_id                     = keycloak_realm.astratex.id
  client_id                    = "kubernetes"
  name                         = "kubernetes"
  enabled                      = true
  access_type                  = "CONFIDENTIAL"
  client_secret                = "kubernetes"
  standard_flow_enabled        = true
  direct_access_grants_enabled = true
  valid_redirect_uris = [
    "*",
  ]
}

resource "keycloak_openid_client_default_scopes" "kubernetes" {
  realm_id  = keycloak_realm.astratex.id
  client_id = keycloak_openid_client.kubernetes.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.astratex_groups.name,
  ]
}
