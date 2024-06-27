# ===== Clients =====

resource "keycloak_openid_client" "grafana" {
  realm_id                     = keycloak_realm.astratex.id
  client_id                    = "grafana"
  name                         = "grafana"
  enabled                      = true
  access_type                  = "CONFIDENTIAL"
  client_secret                = "grafana"
  standard_flow_enabled        = true
  direct_access_grants_enabled = true
  valid_redirect_uris = [
    "*",
  ]
}

resource "keycloak_openid_client_default_scopes" "grafana" {
  realm_id  = keycloak_realm.astratex.id
  client_id = keycloak_openid_client.grafana.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.astratex_groups.name,
  ]
}

resource "keycloak_openid_client" "argocd" {
  realm_id                     = keycloak_realm.astratex.id
  client_id                    = "argocd"
  name                         = "argocd"
  enabled                      = true
  access_type                  = "CONFIDENTIAL"
  client_secret                = "argocd"
  standard_flow_enabled        = true
  direct_access_grants_enabled = true
  valid_redirect_uris = [
    "*",
  ]
  valid_post_logout_redirect_uris = [
    "*",
  ]
}

resource "keycloak_openid_client_default_scopes" "argocd" {
  realm_id  = keycloak_realm.astratex.id
  client_id = keycloak_openid_client.argocd.id
  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.astratex_groups.name,
  ]
}
