resource "keycloak_realm" "astratex" {
  realm                    = "astratex"
  enabled                  = true
  display_name_html        = "<h1>Astratex SSO</h1>"
  login_with_email_allowed = true
  reset_password_allowed   = true
  remember_me              = true
}

resource "keycloak_realm_events" "astratex" {
  lifecycle {
    ignore_changes = [
      events_listeners,
    ]
  }

  realm_id = keycloak_realm.astratex.id

  events_enabled    = true
  events_expiration = 3600

  admin_events_enabled         = true
  admin_events_details_enabled = true
}

resource "keycloak_openid_client_scope" "astratex_groups" {
  realm_id               = keycloak_realm.astratex.id
  name                   = "groups"
  include_in_token_scope = true
  gui_order              = 1
}

resource "keycloak_openid_group_membership_protocol_mapper" "astratex_groups" {
  realm_id        = keycloak_realm.astratex.id
  client_scope_id = keycloak_openid_client_scope.astratex_groups.id
  name            = "groups"
  claim_name      = "groups"
  full_path       = false
}
