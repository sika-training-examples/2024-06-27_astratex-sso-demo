
resource "keycloak_group" "argocd_admin" {
  realm_id = keycloak_realm.astratex.id
  name     = "argocd-admin"
}

resource "keycloak_group" "grafana_admin" {
  realm_id = keycloak_realm.astratex.id
  name     = "grafana-admin"
}

resource "keycloak_group" "kubernetes_admin" {
  realm_id = keycloak_realm.astratex.id
  name     = "kubernetes-admin"
}
