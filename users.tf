# ===== Users =====

locals {
  admins = [
    keycloak_group.argocd_admin.id,
    keycloak_group.grafana_admin.id,
    keycloak_group.kubernetes_admin.id,
  ]

  users = {
    "ondrej"  = ["ondrej@astratex.com", "Ondrej", "Sika", local.admins]
    "bar"     = ["bar@astratex.com", "Bar", "ATX", local.admins]
    "vojtech" = ["vojtech@astratex.com", "Vojtech", "ATX", local.admins]
  }
}

resource "keycloak_user" "user" {
  for_each = local.users

  realm_id       = keycloak_realm.astratex.id
  username       = each.key
  enabled        = true
  email          = each.value[0]
  email_verified = true
  first_name     = each.value[1]
  last_name      = each.value[2]
  initial_password {
    value     = "a"
    temporary = true
  }
}

resource "keycloak_user_groups" "user" {
  for_each = local.users

  realm_id  = keycloak_realm.astratex.id
  user_id   = keycloak_user.user[each.key].id
  group_ids = each.value[3]
}
