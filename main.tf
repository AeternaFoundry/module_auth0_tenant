resource "auth0_tenant" "tenants" {
  for_each = var.tenants

  acr_values_supported                                 = each.value.acr_values_supported
  allow_organization_name_in_authentication_api        = each.value.allow_organization_name_in_authentication_api
  allowed_logout_urls                                  = each.value.allowed_logout_urls
  client_id_metadata_document_supported                = each.value.client_id_metadata_document_supported
  customize_mfa_in_postlogin_action                    = each.value.customize_mfa_in_postlogin_action
  default_audience                                     = each.value.default_audience
  default_directory                                    = each.value.default_directory
  default_redirection_uri                              = each.value.default_redirection_uri
  disable_acr_values_supported                         = each.value.disable_acr_values_supported
  dynamic_client_registration_security_mode            = each.value.dynamic_client_registration_security_mode
  enabled_locales                                      = each.value.enabled_locales
  ephemeral_session_lifetime                           = each.value.ephemeral_session_lifetime
  friendly_name                                        = each.value.friendly_name
  idle_ephemeral_session_lifetime                      = each.value.idle_ephemeral_session_lifetime
  idle_session_lifetime                                = each.value.idle_session_lifetime
  phone_consolidated_experience                        = each.value.phone_consolidated_experience
  picture_url                                          = each.value.picture_url
  pushed_authorization_requests_supported              = each.value.pushed_authorization_requests_supported
  resource_parameter_profile                           = each.value.resource_parameter_profile
  sandbox_version                                      = each.value.sandbox_version
  session_lifetime                                     = each.value.session_lifetime
  skip_non_verifiable_callback_uri_confirmation_prompt = each.value.skip_non_verifiable_callback_uri_confirmation_prompt
  support_email                                        = each.value.support_email
  support_url                                          = each.value.support_url

  dynamic "country_codes" {
    for_each = each.value.country_codes != null ? [each.value.country_codes] : []
    content {
      list = country_codes.value.list
      mode = country_codes.value.mode
    }
  }

  dynamic "default_token_quota" {
    for_each = each.value.default_token_quota != null ? [each.value.default_token_quota] : []
    content {
      dynamic "clients" {
        for_each = default_token_quota.value.clients != null ? [default_token_quota.value.clients] : []
        content {
          client_credentials {
            enforce  = clients.value.client_credentials.enforce
            per_day  = clients.value.client_credentials.per_day
            per_hour = clients.value.client_credentials.per_hour
          }
        }
      }
      dynamic "organizations" {
        for_each = default_token_quota.value.organizations != null ? [default_token_quota.value.organizations] : []
        content {
          client_credentials {
            enforce  = organizations.value.client_credentials.enforce
            per_day  = organizations.value.client_credentials.per_day
            per_hour = organizations.value.client_credentials.per_hour
          }
        }
      }
    }
  }

  dynamic "error_page" {
    for_each = each.value.error_page != null ? [each.value.error_page] : []
    content {
      html          = error_page.value.html
      show_log_link = error_page.value.show_log_link
      url           = error_page.value.url
    }
  }

  dynamic "flags" {
    for_each = each.value.flags != null ? [each.value.flags] : []
    content {
      allow_legacy_delegation_grant_types    = flags.value.allow_legacy_delegation_grant_types
      allow_legacy_ro_grant_types            = flags.value.allow_legacy_ro_grant_types
      allow_legacy_tokeninfo_endpoint        = flags.value.allow_legacy_tokeninfo_endpoint
      dashboard_insights_view                = flags.value.dashboard_insights_view
      dashboard_log_streams_next             = flags.value.dashboard_log_streams_next
      disable_clickjack_protection_headers   = flags.value.disable_clickjack_protection_headers
      disable_fields_map_fix                 = flags.value.disable_fields_map_fix
      disable_management_api_sms_obfuscation = flags.value.disable_management_api_sms_obfuscation
      enable_adfs_waad_email_verification    = flags.value.enable_adfs_waad_email_verification
      enable_apis_section                    = flags.value.enable_apis_section
      enable_client_connections              = flags.value.enable_client_connections
      enable_custom_domain_in_emails         = flags.value.enable_custom_domain_in_emails
      enable_dynamic_client_registration     = flags.value.enable_dynamic_client_registration
      enable_idtoken_api2                    = flags.value.enable_idtoken_api2
      enable_legacy_logs_search_v2           = flags.value.enable_legacy_logs_search_v2
      enable_legacy_profile                  = flags.value.enable_legacy_profile
      enable_pipeline2                       = flags.value.enable_pipeline2
      enable_public_signup_user_exists_error = flags.value.enable_public_signup_user_exists_error
      enable_sso                             = flags.value.enable_sso
      mfa_show_factor_list_on_enrollment     = flags.value.mfa_show_factor_list_on_enrollment
      no_disclose_enterprise_connections     = flags.value.no_disclose_enterprise_connections
      remove_alg_from_jwks                   = flags.value.remove_alg_from_jwks
      require_pushed_authorization_requests  = flags.value.require_pushed_authorization_requests
      revoke_refresh_token_grant             = flags.value.revoke_refresh_token_grant
      use_scope_descriptions_for_consent     = flags.value.use_scope_descriptions_for_consent
    }
  }

  dynamic "mtls" {
    for_each = each.value.mtls != null ? [each.value.mtls] : []
    content {
      disable                 = mtls.value.disable
      enable_endpoint_aliases = mtls.value.enable_endpoint_aliases
    }
  }

  dynamic "oidc_logout" {
    for_each = each.value.oidc_logout != null ? [each.value.oidc_logout] : []
    content {
      rp_logout_end_session_endpoint_discovery = oidc_logout.value.rp_logout_end_session_endpoint_discovery
    }
  }

  dynamic "session_cookie" {
    for_each = each.value.session_cookie != null ? [each.value.session_cookie] : []
    content {
      mode = session_cookie.value.mode
    }
  }

  dynamic "sessions" {
    for_each = each.value.sessions != null ? [each.value.sessions] : []
    content {
      dynamic "anonymous" {
        for_each = sessions.value.anonymous != null ? [sessions.value.anonymous] : []
        content {
          activate_cookie     = anonymous.value.activate_cookie
          lifetime_in_minutes = anonymous.value.lifetime_in_minutes
        }
      }
      oidc_logout_prompt_enabled = sessions.value.oidc_logout_prompt_enabled
    }
  }
}

