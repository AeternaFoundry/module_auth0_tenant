variable "tenants" {
  description = <<EOT
Map of tenants, attributes below
Optional:
    - acr_values_supported
    - allow_organization_name_in_authentication_api
    - allowed_logout_urls
    - client_id_metadata_document_supported
    - customize_mfa_in_postlogin_action
    - default_audience
    - default_directory
    - default_redirection_uri
    - disable_acr_values_supported
    - dynamic_client_registration_security_mode
    - enabled_locales
    - ephemeral_session_lifetime
    - friendly_name
    - idle_ephemeral_session_lifetime
    - idle_session_lifetime
    - phone_consolidated_experience
    - picture_url
    - pushed_authorization_requests_supported
    - resource_parameter_profile
    - sandbox_version
    - session_lifetime
    - skip_non_verifiable_callback_uri_confirmation_prompt
    - support_email
    - support_url
    - country_codes (block):
        - list (required)
        - mode (required)
    - default_token_quota (block):
        - clients (optional, block):
            - client_credentials (required, block):
                - enforce (optional)
                - per_day (optional)
                - per_hour (optional)
        - organizations (optional, block):
            - client_credentials (required, block):
                - enforce (optional)
                - per_day (optional)
                - per_hour (optional)
    - error_page (block):
        - html (optional)
        - show_log_link (optional)
        - url (optional)
    - flags (block):
        - allow_legacy_delegation_grant_types (optional)
        - allow_legacy_ro_grant_types (optional)
        - allow_legacy_tokeninfo_endpoint (optional)
        - dashboard_insights_view (optional)
        - dashboard_log_streams_next (optional)
        - disable_clickjack_protection_headers (optional)
        - disable_fields_map_fix (optional)
        - disable_management_api_sms_obfuscation (optional)
        - enable_adfs_waad_email_verification (optional)
        - enable_apis_section (optional)
        - enable_client_connections (optional)
        - enable_custom_domain_in_emails (optional)
        - enable_dynamic_client_registration (optional)
        - enable_idtoken_api2 (optional)
        - enable_legacy_logs_search_v2 (optional)
        - enable_legacy_profile (optional)
        - enable_pipeline2 (optional)
        - enable_public_signup_user_exists_error (optional)
        - enable_sso (optional)
        - mfa_show_factor_list_on_enrollment (optional)
        - no_disclose_enterprise_connections (optional)
        - remove_alg_from_jwks (optional)
        - require_pushed_authorization_requests (optional)
        - revoke_refresh_token_grant (optional)
        - use_scope_descriptions_for_consent (optional)
    - mtls (block):
        - disable (optional)
        - enable_endpoint_aliases (optional)
    - oidc_logout (block):
        - rp_logout_end_session_endpoint_discovery (required)
    - session_cookie (block):
        - mode (optional)
    - sessions (block):
        - anonymous (optional, block):
            - activate_cookie (optional)
            - lifetime_in_minutes (optional)
        - oidc_logout_prompt_enabled (required)
EOT

  type = map(object({
    acr_values_supported                                 = optional(set(string))
    allow_organization_name_in_authentication_api        = optional(bool)
    allowed_logout_urls                                  = optional(list(string))
    client_id_metadata_document_supported                = optional(bool)
    customize_mfa_in_postlogin_action                    = optional(bool)
    default_audience                                     = optional(string)
    default_directory                                    = optional(string)
    default_redirection_uri                              = optional(string)
    disable_acr_values_supported                         = optional(bool)
    dynamic_client_registration_security_mode            = optional(string)
    enabled_locales                                      = optional(list(string))
    ephemeral_session_lifetime                           = optional(number)
    friendly_name                                        = optional(string)
    idle_ephemeral_session_lifetime                      = optional(number)
    idle_session_lifetime                                = optional(number)
    phone_consolidated_experience                        = optional(bool)
    picture_url                                          = optional(string)
    pushed_authorization_requests_supported              = optional(bool)
    resource_parameter_profile                           = optional(string)
    sandbox_version                                      = optional(string)
    session_lifetime                                     = optional(number)
    skip_non_verifiable_callback_uri_confirmation_prompt = optional(string)
    support_email                                        = optional(string)
    support_url                                          = optional(string)
    country_codes = optional(object({
      list = set(string)
      mode = string
    }))
    default_token_quota = optional(object({
      clients = optional(object({
        client_credentials = object({
          enforce  = optional(bool)
          per_day  = optional(number)
          per_hour = optional(number)
        })
      }))
      organizations = optional(object({
        client_credentials = object({
          enforce  = optional(bool)
          per_day  = optional(number)
          per_hour = optional(number)
        })
      }))
    }))
    error_page = optional(object({
      html          = optional(string)
      show_log_link = optional(bool)
      url           = optional(string)
    }))
    flags = optional(object({
      allow_legacy_delegation_grant_types    = optional(bool)
      allow_legacy_ro_grant_types            = optional(bool)
      allow_legacy_tokeninfo_endpoint        = optional(bool)
      dashboard_insights_view                = optional(bool)
      dashboard_log_streams_next             = optional(bool)
      disable_clickjack_protection_headers   = optional(bool)
      disable_fields_map_fix                 = optional(bool)
      disable_management_api_sms_obfuscation = optional(bool)
      enable_adfs_waad_email_verification    = optional(bool)
      enable_apis_section                    = optional(bool)
      enable_client_connections              = optional(bool)
      enable_custom_domain_in_emails         = optional(bool)
      enable_dynamic_client_registration     = optional(bool)
      enable_idtoken_api2                    = optional(bool)
      enable_legacy_logs_search_v2           = optional(bool)
      enable_legacy_profile                  = optional(bool)
      enable_pipeline2                       = optional(bool)
      enable_public_signup_user_exists_error = optional(bool)
      enable_sso                             = optional(bool)
      mfa_show_factor_list_on_enrollment     = optional(bool)
      no_disclose_enterprise_connections     = optional(bool)
      remove_alg_from_jwks                   = optional(bool)
      require_pushed_authorization_requests  = optional(bool)
      revoke_refresh_token_grant             = optional(bool)
      use_scope_descriptions_for_consent     = optional(bool)
    }))
    mtls = optional(object({
      disable                 = optional(bool)
      enable_endpoint_aliases = optional(bool)
    }))
    oidc_logout = optional(object({
      rp_logout_end_session_endpoint_discovery = bool
    }))
    session_cookie = optional(object({
      mode = optional(string)
    }))
    sessions = optional(object({
      anonymous = optional(object({
        activate_cookie     = optional(bool)
        lifetime_in_minutes = optional(number)
      }))
      oidc_logout_prompt_enabled = bool
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.tenants : (
        v.session_lifetime == null || (v.session_lifetime >= 0.01)
      )
    ])
    error_message = "must be at least 0.01"
  }
  validation {
    condition = alltrue([
      for k, v in var.tenants : (
        v.idle_session_lifetime == null || (v.idle_session_lifetime >= 0.01)
      )
    ])
    error_message = "must be at least 0.01"
  }
  validation {
    condition = alltrue([
      for k, v in var.tenants : (
        v.ephemeral_session_lifetime == null || (v.ephemeral_session_lifetime >= 0.0167)
      )
    ])
    error_message = "must be at least 0.0167"
  }
  validation {
    condition = alltrue([
      for k, v in var.tenants : (
        v.idle_ephemeral_session_lifetime == null || (v.idle_ephemeral_session_lifetime >= 0.0167)
      )
    ])
    error_message = "must be at least 0.0167"
  }
  validation {
    condition = alltrue([
      for k, v in var.tenants : (
        v.session_cookie == null || (v.session_cookie.mode == null || (contains(["persistent", "non-persistent"], v.session_cookie.mode)))
      )
    ])
    error_message = "must be one of: \"persistent\", \"non-persistent\""
  }
  validation {
    condition = alltrue([
      for k, v in var.tenants : (
        v.sessions == null || (v.sessions.anonymous == null || (v.sessions.anonymous.lifetime_in_minutes == null || (v.sessions.anonymous.lifetime_in_minutes >= 1 && v.sessions.anonymous.lifetime_in_minutes <= 525600)))
      )
    ])
    error_message = "must be between 1 and 525600"
  }
  validation {
    condition = alltrue([
      for k, v in var.tenants : (
        v.skip_non_verifiable_callback_uri_confirmation_prompt == null || (contains(["true", "false", "null"], v.skip_non_verifiable_callback_uri_confirmation_prompt))
      )
    ])
    error_message = "must be one of: \"true\", \"false\", \"null\""
  }
  validation {
    condition = alltrue([
      for k, v in var.tenants : (
        v.resource_parameter_profile == null || (contains(["audience", "compatibility"], v.resource_parameter_profile))
      )
    ])
    error_message = "must be one of: \"audience\", \"compatibility\""
  }
  validation {
    condition = alltrue([
      for k, v in var.tenants : (
        v.dynamic_client_registration_security_mode == null || (contains(["strict", "permissive"], v.dynamic_client_registration_security_mode))
      )
    ])
    error_message = "must be one of: \"strict\", \"permissive\""
  }
  validation {
    condition = alltrue([
      for k, v in var.tenants : (
        v.country_codes == null || (alltrue([for x in v.country_codes.list : can(regex("^[A-Z]{2}$", x))]))
      )
    ])
    error_message = "must be an uppercase ISO 3166-1 alpha-2 country code (e.g. \"US\", \"GB\")"
  }
  validation {
    condition = alltrue([
      for k, v in var.tenants : (
        v.country_codes == null || (contains(["allow", "deny"], v.country_codes.mode))
      )
    ])
    error_message = "must be one of: \"allow\", \"deny\""
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

