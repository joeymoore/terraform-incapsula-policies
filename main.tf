resource "incapsula_policy" "embargo_nation_block" {
    account_id      = var.account_id
    description     = "Block embargoed countries from accessing sites."
    enabled         = true
    name            = "Embargoed Nations"
    policy_settings = jsonencode(
        [
            {
                data = {
                    geo = {
                        countries = [
                            "CU",
                            "IR",
                            "KR",
                            "SD",
                            "SY",
                            "RU",
                        ]
                    }
                }
                policySettingType = "GEO"
                settingsAction    = "BLOCK"
            },
        ]
    )
    policy_type     = "ACL"
}

resource "incapsula_policy" "dynamic_country_block" {
    account_id      = var.account_id
    description     = "Block a list of countries based on attack."
    enabled         = true
    name            = "Dynamic Country Blocks"
    policy_settings = jsonencode(
        [
            {
                data = {
                    geo = {
                        countries = var.countries
                    }
                }
                policySettingType = "GEO"
                settingsAction    = "BLOCK"
            },
        ]
    )
    policy_type     = "ACL"
}

resource "incapsula_policy" "dynamic_ip_block" {
    account_id      = var.account_id
    description     = "Block a list of ip addresses based on attack."
    enabled         = true
    name            = "Dynamic IP Address Blocks"
    policy_settings = jsonencode(
        [
            {
                data = {
                    ips = var.ips
                }
                policySettingType = "IP"
                settingsAction    = "BLOCK"
            },
        ]
    )
    policy_type     = "ACL"
}